//
//  IRFEmojiCheatSheet.h
//  IRFEmojiCheatSheet
//
//  Created by Fabio Pelosin on 08/11/13.
//  Copyright (c) 2013 Fabio Pelosin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Offers programmatic access to emojis as organized in the 
 emoji-cheat-sheet.com website.
 */
@interface IRFEmojiCheatSheet : NSObject

/**
 Returns the list of the emoji groups found on the emoji-cheat-sheet.com
 website in the same order.
 */
+ (NSArray*)groups;

/**
 Returns a dictionary where the keys are the names of the groups and the values
 are the lists of the emoji aliases associated with that group.
 */
+ (NSDictionary*)emojisByGroup;

/**
 Returns a dictionary which maps the aliases to the emoji characters.
 */
+ (NSDictionary *)emojisByAlias;

/**
 Replaces the aliases surrounded by colons with the emoji characters.
 */
+ (NSString*)stringByReplacingEmojiAliasesInString:(NSString*)string;

@end
