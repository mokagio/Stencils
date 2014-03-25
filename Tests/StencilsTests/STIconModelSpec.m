
#import <Kiwi.h>
#import <STIconModel.h>

SPEC_BEGIN(STIconModelSpec)

describe(@"STIconModel", ^{
    it(@"should init with a paddingLeft of 1", ^{
        STIconModel *model = [[STIconModel alloc] init];
        [[theValue(model.baselineAdjustement) should] equal:theValue(1)];
    });
    
    it(@"should init with a paddingTop of 1", ^{
        STIconModel *model = [[STIconModel alloc] init];
        [[theValue(model.scaleAdjustement) should] equal:theValue(1)];
    });
});

SPEC_END