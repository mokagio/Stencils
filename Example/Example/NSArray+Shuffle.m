
#import "NSArray+Shuffle.h"

@implementation NSArray (Shuffle)

- (NSArray *)shuffledArray
{
    // See -The "inside-out" algorithm- at http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
    // for the algorithm source
    NSMutableArray *shuffled = self.mutableCopy;
    for (NSInteger index = 0; index < [shuffled count]; index++) {
        NSInteger randomIndex = arc4random() % (index + 1);
        id value = shuffled[index];
        [shuffled replaceObjectAtIndex:index withObject:shuffled[randomIndex]];
        [shuffled replaceObjectAtIndex:randomIndex withObject:value];
    }
    return shuffled;
}

@end
