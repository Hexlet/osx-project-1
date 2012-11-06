#import <Foundation/Foundation.h>

#define DNA_CAPACITY 100

@interface Cell : NSObject {
    NSString *nucleotides;
}

@property (readonly) NSMutableArray *DNA;

-(int) hammingDistance:(Cell*) cell;
-(NSString*) getRandomNucleotide;
-(void) print;

@end
