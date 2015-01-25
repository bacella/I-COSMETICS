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

@synthesize txtTrattamento;

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

    if ([bodyPartSelection  isEqualToString: @"Viso"]) {
        if ([skinTypeSelection  isEqualToString: @"Giovane"]) {
            [self selezione110];
        } else if ([skinTypeSelection isEqualToString: @"Media"]) {
            [self selezione120];
        } else if ([skinTypeSelection isEqualToString: @"Matura"]) {
            [self selezione130];
        }
    } else if ([bodyPartSelection isEqualToString: @"Corpo"]) {
        if ([skinTypeSelection  isEqualToString: @"Giovane"]) {
            [self selezione2100];
        } else if ([skinTypeSelection isEqualToString: @"Media"]) {
            [self selezione2200];
        } else if ([skinTypeSelection isEqualToString: @"Matura"]) {
            [self selezione2300];
        }
    }
}

// Trattamento Viso | Pelli Giovani
- (void)selezione110 {
    txtTrattamento.text = @"Detergente\nPeeling Enzimatico\nRadiofrequenza Gel Normale Viso\nGel Radiofrequenze\nLenitiva";
}

// Trattamento Viso | Pelli Medie
- (void)selezione120 {
    txtTrattamento.text = @"Detergente\nPeeling Enzimatico\nRadiofrequenze Gel Livello 1\nGel Radiofrequenze Livello 1\nLenitiva";
}

// Trattamento Viso | Pelli Mature
- (void)selezione130 {
    txtTrattamento.text = @"Detergente\nPeeling Enzimatico\nRadiofrequenze Gel Livello 2\nGel Radiofrequenze Livello 2\nLenitiva";
}

// Trattamento Viso | Pelli Giovani (Post Trattamento Consigliato)
- (void)selezione101 {
    txtTrattamento.text = @"Lenitiva\nCrema Antirughe\nContorno Occhi\nAcido Jaluronico";
}

// Trattamento Viso | Pelli Medie (Post Trattamento Consigliato)
- (void)selezione102 {
    txtTrattamento.text = @"Lenitiva\nCrema Lifting Livello 1\nContorno Occhi Livello 1\nAcido Jaluronico Livello 1";
}

// Trattamento Viso | Pelli Mature (Post Trattamento Consigliato)
- (void)selezione103 {
    txtTrattamento.text = @"Lenitiva\nCrema Lifting Livello 2\nSiero Antimacchia\nContorno Occhi Livello 2\nAcido Jaluronico Livello 2";
}

// Trattamento Corpo / Pelli Giovani
- (void)selezione2100 {
    txtTrattamento.text = @"Detergente\nRadiofrequenze\nCavitazione\nGel Corpo\nLenitiva";
}

// Trattamento Corpo / Pelli Medie
- (void)selezione2200 {
    txtTrattamento.text = @"Detergente\nRadiofrequenze\nCavitazione\nGel Corpo Livello 1\nLenitiva";
}

// Trattamento Corpo / Pelli Mature
- (void)selezione2300 {
    txtTrattamento.text = @"Detergente\nRadiofrequenze\nCavitazione\nGel Corpo Livello 2\nLenitiva";
}
// Trattamento Corpo / Pelli Giovani (Cosmetici Consigliati)
- (void)selezione2010 {
    txtTrattamento.text = @"Docciaschiuma\nCrema Seno\nRassodante\nAnti-smagliature";
}

// Trattamento Corpo / Pelli Medie (Cosmetici Consigliati)
- (void)selezione2020 {
    txtTrattamento.text = @"Docciaschiuma\nCrema Seno 1\nRassodante\nAnti-smagliature";
}

// Trattamento Corpo / Pelli Mature (Cosmetici Consigliati)
- (void)selezione2030 {
    txtTrattamento.text = @"Docciaschiuma\nCrema Seno 2\nRassodante\nAnti-smagliature";
}

// Trattamento Corpo / Pelli Giovani (Integratori Consigliati)
- (void)selezione2001 {
    txtTrattamento.text = @"Antiossidante\nDrenante\nAnticellulite";
}

// Trattamento Corpo / Pelli Medie (Integratori Consigliati)
- (void)selezione2002 {
    txtTrattamento.text = @"Antiossidante\nDrenante\nAnticellulite";
}

// Trattamento Corpo / Pelli Mature (Integratori Consigliati)
- (void)selezione2003 {
    txtTrattamento.text = @"Antiossidante\nDrenante\nAnticellulite";
}
@end
