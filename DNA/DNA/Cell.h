#import <Foundation/Foundation.h>

@interface Cell : NSObject

@property (readonly) NSMutableArray *DNA;
@property (readonly) NSString *nucleotides;

-(int) hammingDistance:(Cell*) cell;

@end
