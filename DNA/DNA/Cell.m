#import "Cell.h"

@implementation Cell 

-(id) init {
    self = [super init];
    if (self) {
        // Определяем нуклеотиды в виде строки, что бы в случае необходимости
        // можно было легко добавить нужные или удалить ненужные
        nucleotides = @"ATGC";
        _DNA = [[NSMutableArray alloc] initWithCapacity:DNA_CAPACITY];
        
        for (int i = 0; i < DNA_CAPACITY; i++) {
            [_DNA addObject:[self getRandomNucleotide]];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell*) cell {
    int distance = 0;
    
    for (int i = 0; i < [_DNA count]; i++) {
        if ([[_DNA objectAtIndex:i] isNotEqualTo:[[cell DNA] objectAtIndex:i]]) {
            distance++;
        }
    }
    
    return distance;
}

-(NSString*) getRandomNucleotide {
    int nucleotide_position = arc4random() % [nucleotides length];
    return [NSString stringWithFormat:@"%C", [nucleotides characterAtIndex:nucleotide_position]];
}

-(void) print {
    NSMutableString *str = [NSMutableString string];
    
    for (int i = 0; i < [_DNA count]; i++) {
        [str appendString:[_DNA objectAtIndex: i]];
    }
    
    NSLog(@"%@", str);
}

@end
