#import "Cell.h"

@interface Cell (mutator)                                   //объявление категории
- (void) mutate: (int) mutationPercentage;
@end