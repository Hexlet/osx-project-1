
#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    NSInteger len;
    int  count;
    NSMutableArray *cellDna;
    
}

@property  NSMutableArray *DNA;
@property NSArray *arrayOfDNAChars;

-(int) hammingDistance: (Cell*) cellObject;
@end
