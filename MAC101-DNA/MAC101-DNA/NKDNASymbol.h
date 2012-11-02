//
//  NKDNASymbol.h
//  MAC101-DNA
//
//  Created by Nikita Korchagin on 31.10.12.
//  Copyright (c) 2012 Hexlet. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, DNASymbolType)  {
    DNASymbolTypeA = 0,
    DNASymbolTypeT,
    DNASymbolTypeG,
    DNASymbolTypeC
};

@interface NKDNASymbol : NSObject

@property (nonatomic, assign) DNASymbolType type;

+ (NKDNASymbol *)DNASymbolWithRandomType;

- (id)initWithType:(DNASymbolType)type;

- (void)mutate;

@end
