#import "Cell.h"

@interface Cell()
- (void)generateDNA;
@end

@implementation Cell 

-(id)init: {
    self = [super init];
    if (self){
        _DNALength = 100;
        [self generateDNA]
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

@end