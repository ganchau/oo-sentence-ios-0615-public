//
//  FISSentence.h
//  OO-sentence
//
//  Created by Gan Chau on 5/20/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISSentence : NSObject

@property (strong, nonatomic) NSMutableArray *words;

- (NSString *)stringFormat;
- (NSNumber *)numOfWords;
- (BOOL)containsWord:(NSString *)searchWord;
- (BOOL)isProperSentence;
- (BOOL)isEqualToSentence:(FISSentence *)compareSentence;

@end
