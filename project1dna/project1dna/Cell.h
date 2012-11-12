
#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSMutableArray *cellDna;
}

@property NSMutableArray *DNA;
@property NSArray *arrayOfDNAChars;

-(int) hammingDistance: (Cell*) cellObject;

@end
