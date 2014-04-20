
#import "TempViewController.h"
#import <UIColor+FlatColors.h>
#import <UIFont+OpenSans.h>
#import <STIconsFactory.h>
#import "NSArray+Shuffle.h"

static NSString *kCellIdentifier = @"CellIdentifier";

static CGFloat kMargin = 20;
static NSTimeInterval kRefreshInterval = 0.86;

@interface TempViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *footerLabel;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) STIconsFactory *factory;
@property (nonatomic, strong) NSArray *icons;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation TempViewController

- (id)init
{
    return [self initWithNibName:@"TempViewController" bundle:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) { return nil; }

    self.factory = [[STIconsFactory alloc] init];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Stencils" ofType:@"plist"];
    NSDictionary *settingsDictionary = nil;
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        settingsDictionary = [NSDictionary dictionaryWithContentsOfFile:filePath];
    }

    NSMutableArray *iconsData = [NSMutableArray array];
    [settingsDictionary[@"font-icons"] enumerateObjectsUsingBlock:^(NSDictionary *iconData, NSUInteger idx, BOOL *stop) {
        [iconsData addObject:[iconData[@"icon-name"] copy]];
    }];

    self.icons = iconsData;

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor flatCloudsColor];

    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;

    self.collectionView.backgroundColor = [UIColor clearColor];

    self.titleLabel.font = [UIFont openSansLightFontOfSize:38];
    self.titleLabel.text = @"Stencils";
    self.titleLabel.textColor = [UIColor flatMidnightBlueColor];

    self.footerLabel.font = [UIFont openSansFontOfSize:20];
    self.footerLabel.text = @"Use icon-fonts in your apps";
    self.footerLabel.textColor = [UIColor flatMidnightBlueColor];

    self.timer = [NSTimer scheduledTimerWithTimeInterval:kRefreshInterval target:self selector:@selector(reloadView) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    [self.timer fire];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [self.timer invalidate];
}

#pragma mark - 

- (void)reloadView
{
    self.icons = [self.icons shuffledArray];
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];

    if (indexPath.row < [self.icons count]) {
        STIconView *view = [self.factory iconViewForIconNamed:self.icons[indexPath.row]
                                                     withSide:cell.contentView.frame.size.width];
        view.color = [UIColor flatWetAsphaltColor];

        // suboptiomal
        [[cell.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [cell.contentView addSubview:view];
    }

    return cell;
}

#pragma mark - UICollectionViewDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat side = (collectionView.frame.size.width - 3 * kMargin) / 4;
    return CGSizeMake(side, side);
}

#pragma mark - UICollectonViewDelegateFlowLayout

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return kMargin;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kMargin;
}

#pragma mark -

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
