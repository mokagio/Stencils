
#import "IconsExampleViewController.h"
@import Stencils;

static NSString *kCellIdentifier = @"CellIdentifier";

@interface IconsExampleViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) STIconsFactory *factory;
@property (nonatomic, strong) NSArray *icons;
@end

@implementation IconsExampleViewController

- (id)init
{
    self = [super init];
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

    self.view.backgroundColor = [UIColor whiteColor];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGRect frame = CGRectMake(10, 30, self.view.bounds.size.width - 20, self.view.bounds.size.height);
    self.collectionView = [[UICollectionView alloc] initWithFrame:frame
                                             collectionViewLayout:layout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;

    self.collectionView.backgroundColor = [UIColor clearColor];

    [self.view addSubview:self.collectionView];
}

#pragma mark - 

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.icons count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];

    STIconView *view = [self.factory iconViewForIconNamed:self.icons[indexPath.row]
                                                 withSide:cell.contentView.frame.size.width];
    view.color = [UIColor blackColor];
    [cell.contentView addSubview:view];

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 80);
}

@end
