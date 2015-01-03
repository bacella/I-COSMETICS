//
//  ViewController.m
//  I-COSMETICS
//
//  Created by gianni on 12/26/14.
//  Copyright (c) 2014 gianni. All rights reserved.
//
// -------- Reference ---------------------------//
// http://codewithchris.com/uipickerview-example/
// 

#import "ViewController.h"

@interface ViewController () {
    NSArray *_pickerDataTrattamento;
    NSArray *_pickerDataPelle;
}

@end

@implementation ViewController

@synthesize bodyPartSelection;
@synthesize skinTypeSelection;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Initialize data
    _pickerDataTrattamento = @[@"Viso", @"Corpo"];
    _pickerDataPelle = @[@"Giovane", @"Media", @"Matura"];
    
    // Connect data
    self.mainSelection.dataSource = self;
    self.mainSelection.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return [_pickerDataTrattamento count];
    } else {
        return [_pickerDataPelle count];
    }
//    return _pickerDataTrattamento.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [_pickerDataTrattamento objectAtIndex:row];
    } else {
        return [_pickerDataPelle objectAtIndex:row];
    }
//    return _pickerDataTrattamento[row];
}

// Action upon pickerView selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        bodyPartSelection = [[NSString alloc] initWithFormat:@"%@", [_pickerDataTrattamento objectAtIndex:row]];
    } else {
        skinTypeSelection = [[NSString alloc] initWithFormat:@"%@", [_pickerDataPelle objectAtIndex:row]];
    }
}

- (IBAction)pageControlIndicator:(id)sender {
}
@end
