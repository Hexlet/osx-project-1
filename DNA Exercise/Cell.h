#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    int i, j;
}
@property NSMutableArray* DNA;
@property NSArray* nucleotides;
@property int distance;
-(int)hammingDistance:(NSMutableArray*)d;
@end