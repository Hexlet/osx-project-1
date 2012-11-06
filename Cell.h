
#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) int DNALength;
@property NSMutableArray *DNA;
- (id)initWithDNALen:(int);
- (int)hammingDistance: (Cell*);
@end