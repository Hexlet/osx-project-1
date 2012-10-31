#import <Foundation/Foundation.h>


#define kDNALength 100
#define kMaxDNAItems 4
extern const NSString *DNAItems[kMaxDNAItems];

@interface Cell : NSObject
{
    NSMutableArray *dna;
}

// делаем тру-ридонли свойство с именем dna
@property (nonatomic, readonly) NSArray *dna;

+ (id) cell;

- (unsigned) hammingDistance: (Cell *) cell;

@end