#import "Cell.h"

#define DNALngth 100

@interface Cell()
- (void)generateDNA;
@end

@implementation Cell 

-(id)init {
    self = [super init];
    if (self){
        _DNALength = DNALngth;
        [self generateDNA];
    }
    return self;
}

-(void) generateDNA{
    _DNA = [[NSMutableArray alloc] initWithCapacity:self.DNALength];
    NSArray *nucleotids = [[NSArray alloc] initWithObjects: @"A", @"G", @"T", @"C", nil];
    for (int i = 0; i < self.DNALength; i++) {
        [_DNA addObject: [nucleotids objectAtIndex:arc4random() % 4]];
    }
}

-(int)hammingDistance:(Cell *) compare {
    int hd = 0;
    for (int i=0; i < self.DNALength; i++){
        if ( [_DNA objectAtIndex:i] != [[compare DNA] objectAtIndex:i]){
            hd++;
        }
    }
    return hd;
}

-(NSString *) description {
    NSString * dna = @"";
    for(int i=0; i< self.DNALength; i++){
        dna = [dna stringByAppendingString:[self.DNA objectAtIndex:i]];
    }
    return dna;
}

@end