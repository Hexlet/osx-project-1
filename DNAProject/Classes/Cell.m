//
// Created by eugenedymov on 31.10.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Cell.h"
#import "CellElement.h"

@interface Cell ()

@property(strong) NSMutableArray *dna;

/* Заполняет клетку рандомно */
- (void)randomFill;

@end

@implementation Cell {
    NSMutableArray *_dna;
}
@synthesize dna = _dna;


- (id)init {
    self = [super init];
    if (self) {
        self.dna = [[NSMutableArray alloc] initWithCapacity:kCellDNALength];
        [self randomFill];
    }

    return self;
}

- (void)randomFill {
    for (int i = 0; i < kCellDNALength; ++i) {
        [self.dna addObject:[CellElement randomElement]];
    }
}

- (int)hammingDistance:(Cell *)toCell {
    int hammingDistanceResult = 0;

    for (NSUInteger i = 0; i < kCellDNALength; ++i) {
        if (![self.dna[i] isEqual:toCell.dna[i]]) {
            hammingDistanceResult++;
        }
    }

    return hammingDistanceResult;
}

- (NSString *)description {

    // Формируем более human-readable вывод
    NSMutableString *string = [[NSMutableString alloc] init];
    for (CellElement *element in self.dna) {
        [string appendString:element.description];
    }

    return string;
}


@end