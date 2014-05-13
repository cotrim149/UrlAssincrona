//
//  main.m
//  UrlAssincrona
//
//  Created by ALS on 06/05/14.
//  Copyright (c) 2014 Cotrim. All rights reserved.
//

#import <Cocoa/Cocoa.h>


int main(int argc, char *argv[])
{

    NSString *urlAsString = @"http://en.wikipedia.org/wiki/Main_Page";
    //NSString *urlAsString = @"http://bulbapedia.bulbagarden.net/wiki/Bulbasaur_(Pokemon)";
    NSURL *url = [NSURL URLWithString:urlAsString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response,NSData *data, NSError *error)
    {
         
         if ([data length] >0 && error == nil)
         {
             [data writeToFile:@"/tmp/articuno.html" atomically:YES];
             NSLog(@"%@",data);
         }
         else if ([data length] == 0 && error == nil)
         {
             NSLog(@"Nothing was downloaded.");
         }
         else if (error != nil){
             NSLog(@"Error = %@", error);
         }
         
     }];
    
    return NSApplicationMain(argc, (const char **)argv);
}
