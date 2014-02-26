
#import <Kiwi.h>
#import <MTFontIconModel.h>

SPEC_BEGIN(MTFontIconModelSpec)

describe(@"MTFontIconModel", ^{
    it(@"should init with a paddingLeft of 0", ^{
        MTFontIconModel *model = [[MTFontIconModel alloc] init];
        [[theValue(model.paddingLeft) should] equal:theValue(0)];
    });
    
    it(@"should init with a paddingTop of 0", ^{
        MTFontIconModel *model = [[MTFontIconModel alloc] init];
        [[theValue(model.paddingTop) should] equal:theValue(0)];
    });
});

SPEC_END