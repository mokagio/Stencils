
#import <Kiwi.h>
#import <MTFontIconModel.h>

SPEC_BEGIN(MTFontIconModelSpec)

describe(@"MTFontIconModel", ^{
    it(@"should init with a paddingLeft of 1", ^{
        MTFontIconModel *model = [[MTFontIconModel alloc] init];
        [[theValue(model.baselineAdjustement) should] equal:theValue(1)];
    });
    
    it(@"should init with a paddingTop of 1", ^{
        MTFontIconModel *model = [[MTFontIconModel alloc] init];
        [[theValue(model.scaleAdjustement) should] equal:theValue(1)];
    });
});

SPEC_END