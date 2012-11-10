
#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly, strong, nonatomic) NSMutableArray *randoms;
@property (readonly) NSUInteger capacity;
@property (readonly, strong, nonatomic) NSMutableArray *DNA;
@property (readonly, strong, nonatomic) NSArray *DNAItems;


- (id)init;
- (NSInteger)hammingDistance:(Cell *)other;

@end
