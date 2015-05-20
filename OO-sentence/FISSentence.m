//
//  FISSentence.m
//  OO-sentence
//
//  Created by Gan Chau on 5/20/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISSentence.h"

@implementation FISSentence

- (NSMutableArray *)words
{
    return _words;
}

- (NSString *)stringFormat
{
    return [self.words componentsJoinedByString:@" "];
}

- (NSNumber *)numOfWords
{
    return @([self.words count]);
}

- (BOOL)containsWord:(NSString *)searchWord
{
    for (NSString *word in self.words) {
        if ([word isEqualToString:searchWord]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isProperSentence
{
    NSString *firstWord = [self.words firstObject];    //store first word
    NSString *lastWord = [self.words lastObject];      //store last word
    
    if ([firstWord isEqualToString:[firstWord capitalizedString]]) {   //if the first word is capitalized then proceed
        //if the last word ends with a "." or "!" or "?" then return YES
        if ([lastWord hasSuffix:@"."] || [lastWord hasSuffix:@"!"] || [lastWord hasSuffix:@"?"]) {
            return YES;
        }
    }
    return NO;  //if it's not a proper sentence, return NO
}

- (BOOL)isEqualToSentence:(FISSentence *)compareSentence
{
    //compare our sentence with a given sentence passed in as a parameter
    //they are identical, even if the first word is or is not capitalized
    //they are identical, even if the last word ends with a punctuation or not
    
    NSString *thisSentence = [[self stringFormat] capitalizedString];   //store this sentence in capitalized format
    NSString *thatSentence = [[compareSentence stringFormat] capitalizedString];  //store that sentence in capitalized format
    
    //if this sentence ends in a punctuation, disregard it
    if ([thisSentence hasSuffix:@"."] || [thisSentence hasSuffix:@"!"] || [thisSentence hasSuffix:@"?"]) {
        thisSentence = [thisSentence substringToIndex:[thisSentence length] - 1];
    }
    
    //if that sentence ends in a punctuation, desregard it
    if ([thatSentence hasSuffix:@"."] || [thatSentence hasSuffix:@"!"] || [thatSentence hasSuffix:@"?"]) {
        thatSentence = [thatSentence substringToIndex:[thatSentence length] - 1];
    }
    
    if ([thisSentence isEqualToString:thatSentence]) {   //compare the two sentence
        return YES;    //return YES if they are identical
    }
    
    return NO;   //otherwise return NO
}

@end
