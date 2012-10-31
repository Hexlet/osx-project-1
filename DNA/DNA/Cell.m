#import "Cell.h"

@implementation Cell

-(id) init {
    self = [super init];
    if (self) {
        NSUInteger DNACapacity = 100;
        // Определяем нуклеотиды в виде строки, что бы в случае необходимости
        // можно было легко добавить нужные или удалить ненужные
        _nucleotides = @"ATGC";
        _DNA = [[NSMutableArray alloc] initWithCapacity:DNACapacity];
        
        for (int i = 0; i <= 100; i++) {
            int nucleotide = arc4random() % [_nucleotides length];

            // Перед добавлением нуклеотида в ДНК, преобразуем его из unichar в
            // NSString
            [_DNA addObject:[NSString stringWithFormat:@"%C", [_nucleotides characterAtIndex:nucleotide]]];
        }
    }
    return self;
}

-(int) hammingDistance:(Cell*) cell {
    int distance = 0;
    
    for (int i = 0; i < [_DNA count]; i++) {
        if ([_DNA[i] isNotEqualTo:[cell DNA][i]]) {
            distance++;
        }
    }
    
    return distance;
}

@end
