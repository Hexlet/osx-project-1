
#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) int DNALength;
@property NSMutableArray *DNA;
- (int)hammingDistance:(Cell*)compare;
- (void) print;
@end