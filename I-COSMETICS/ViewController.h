//
//  ViewController.h
//  I-COSMETICS
//
//  Created by gianni on 12/26/14.
//  Copyright (c) 2014 gianni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *mainSelection;
@property (weak, nonatomic) IBOutlet UITextView *textTrattamento;
- (IBAction)pageControlIndicator:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *selezioneTrattamentoPelle;

@property (weak, nonatomic) IBOutlet UITextView *txtTrattamentoVisoPelliGiovani;
@property (weak, nonatomic) IBOutlet UITextView *txtTrattamentoVisoPelliMedie;
@property (weak, nonatomic) IBOutlet UITextView *txtTrattamentoVisoPelliMature;


@property (strong, nonatomic) NSString *bodyPartSelection;
@property (strong, nonatomic) NSString *skinTypeSelection;

@end

