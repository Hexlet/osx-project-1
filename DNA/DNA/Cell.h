#import <Foundation/Foundation.h>

@interface Cell : NSObject {
    NSString *nucleotides;
}

@property (readonly) NSMutableArray *DNA;

-(int) hammingDistance:(Cell*) cell;
-(NSString*) getRandomNucleotide;

@end
