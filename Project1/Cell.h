#import <Foundation/Foundation.h>

@interface Cell: NSObject{
    NSMutableArray *_dna;
}

@property NSMutableArray *dna;

-(int)hammingDistance: (Cell*)other;
-(NSString*)getRandomSym: (NSString*)x;

@end
