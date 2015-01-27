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
@synthesize txtPostTrattamento;
@synthesize txtIntegratori;

@synthesize lblRecipeTitle;

@synthesize pageController;

// Swipe
- (IBAction)swipe:(id)sender {
    // NSLog(@"swiped");
    
    UISwipeGestureRecognizerDirection direction = [(UISwipeGestureRecognizer *) sender direction];
    
    if (pageController.numberOfPages == 2) {
        if ((txtTrattamento.hidden == false) && (direction == UISwipeGestureRecognizerDirectionLeft)) {
            lblRecipeTitle.text = @"Post Trattamento";
            txtTrattamento.hidden = true;
            txtPostTrattamento.hidden = false;
            pageController.currentPage = 1;
        } else if ((txtPostTrattamento.hidden == false) && (direction == UISwipeGestureRecognizerDirectionRight)){
            lblRecipeTitle.text = @"Trattamento";
            txtTrattamento.hidden = false;
            txtPostTrattamento.hidden = true;
            pageController.currentPage = 0;
        }
    } else if (pageController.numberOfPages == 3) {
        if (((txtTrattamento.hidden == false) && (direction == UISwipeGestureRecognizerDirectionLeft)) || ((txtIntegratori.hidden == false) && (direction == UISwipeGestureRecognizerDirectionRight))) {
            lblRecipeTitle.text = @"Post Trattamento";
            txtTrattamento.hidden = true;
            txtPostTrattamento.hidden = false;
            txtIntegratori.hidden = true;
            pageController.currentPage = 1;
        } else if ((txtPostTrattamento.hidden == false) && (direction == UISwipeGestureRecognizerDirectionLeft)) {
            lblRecipeTitle.text = @"Integratori";
            txtTrattamento.hidden = true;
            txtPostTrattamento.hidden = true;
            txtIntegratori.hidden = false;
            pageController.currentPage = 2;
        } else if ((txtPostTrattamento.hidden == false) && (direction == UISwipeGestureRecognizerDirectionRight)) {
            lblRecipeTitle.text = @"Trattamento";
            txtTrattamento.hidden = false;
            txtPostTrattamento.hidden = true;
            txtIntegratori.hidden = true;
            pageController.currentPage = 0;
        }
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Initialize data
    _pickerDataTrattamento = @[@"Viso", @"Corpo"];
    _pickerDataPelle = @[@"Giovane", @"Media", @"Matura"];
    
    // Load stating variables from picker initial (zero) position
    bodyPartSelection = [[NSString alloc] initWithFormat:@"%@", [_pickerDataTrattamento objectAtIndex:0]];
    skinTypeSelection = [[NSString alloc] initWithFormat:@"%@", [_pickerDataPelle objectAtIndex:1]];

    // App startup data to display
    lblRecipeTitle.text = @"Trattamento";
    txtTrattamento.text = @"Detergente\nPeeling Enzimatico\nRadiofrequenza Gel Normale Viso\nGel Radiofrequenze\nLenitiva";
    txtPostTrattamento.text = @"Lenitiva\nCrema Antirughe\nContorno Occhi\nAcido Jaluronico";
    
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
        [self newSelection];
    } else {
        skinTypeSelection = [[NSString alloc] initWithFormat:@"%@", [_pickerDataPelle objectAtIndex:row]];
        [self newSelection];
    }
    
    [self resetViewUponBodyPartSelection];
}

// Reset Recipe View
- (void)resetViewUponBodyPartSelection {
    lblRecipeTitle.text = @"Trattamento";
    txtTrattamento.hidden = false;
    txtPostTrattamento.hidden = true;
    txtIntegratori.hidden = true;
    pageController.currentPage = 0;
}

- (void)newSelection {
    // Determina Selezione (Combinazioni)
    /* Legenda Selezione:
     *  Trattamento Viso    + Pelle Giovane    = 11
     *  Trattamento Viso    + Pelle Media      = 12
     *  Trattamento Viso    + Pelle Matura     = 13
     *  Trattamento Corpo   + Pelle Giovane    = 21
     *  Trattamento Corpo   + Pelle Media      = 22
     *  Trattamento Corpo   + Pelle Matura     = 23
     */
    if ([bodyPartSelection  isEqualToString: @"Viso"]) {
        pageController.numberOfPages = 2;
        if ([skinTypeSelection  isEqualToString: @"Giovane"]) {
            [self selezione11];
        } else if ([skinTypeSelection isEqualToString: @"Media"]) {
            [self selezione12];
        } else if ([skinTypeSelection isEqualToString: @"Matura"]) {
            [self selezione13];
        }
    } else if ([bodyPartSelection isEqualToString: @"Corpo"]) {
        pageController.numberOfPages = 3;
        if ([skinTypeSelection  isEqualToString: @"Giovane"]) {
            [self selezione21];
        } else if ([skinTypeSelection isEqualToString: @"Media"]) {
            [self selezione22];
        } else if ([skinTypeSelection isEqualToString: @"Matura"]) {
            [self selezione23];
        }
    }
}

// Trattamento Viso | Pelli Giovani
- (void)selezione11 {
    txtTrattamento.text = @"Detergente\nPeeling Enzimatico\nRadiofrequenza Gel Normale Viso\nGel Radiofrequenze\nLenitiva";
    txtPostTrattamento.text = @"Lenitiva\nCrema Antirughe\nContorno Occhi\nAcido Jaluronico";
}

// Trattamento Viso | Pelli Medie
- (void)selezione12 {
    txtTrattamento.text = @"Detergente\nPeeling Enzimatico\nRadiofrequenze Gel Livello 1\nGel Radiofrequenze Livello 1\nLenitiva";
    txtPostTrattamento.text = @"Lenitiva\nCrema Lifting Livello 1\nContorno Occhi Livello 1\nAcido Jaluronico Livello 1";
}

// Trattamento Viso | Pelli Mature
- (void)selezione13 {
    txtTrattamento.text = @"Detergente\nPeeling Enzimatico\nRadiofrequenze Gel Livello 2\nGel Radiofrequenze Livello 2\nLenitiva";
    txtPostTrattamento.text = @"Lenitiva\nCrema Lifting Livello 2\nSiero Antimacchia\nContorno Occhi Livello 2\nAcido Jaluronico Livello 2";
}

// Trattamento Corpo / Pelli Giovani
- (void)selezione21 {
    txtTrattamento.text = @"Detergente\nRadiofrequenze\nCavitazione\nGel Corpo\nLenitiva";
    txtPostTrattamento.text = @"Docciaschiuma\nCrema Seno\nRassodante\nAnti-smagliature";
    txtIntegratori.text = @"Antiossidante\nDrenante\nAnticellulite";
}

// Trattamento Corpo / Pelli Medie
- (void)selezione22 {
    txtTrattamento.text = @"Detergente\nRadiofrequenze\nCavitazione\nGel Corpo Livello 1\nLenitiva";
    txtPostTrattamento.text = @"Docciaschiuma\nCrema Seno 1\nRassodante\nAnti-smagliature";
    txtIntegratori.text = @"Antiossidante\nDrenante\nAnticellulite";
}

// Trattamento Corpo / Pelli Mature
- (void)selezione23 {
    txtTrattamento.text = @"Detergente\nRadiofrequenze\nCavitazione\nGel Corpo Livello 2\nLenitiva";
    txtPostTrattamento.text = @"Docciaschiuma\nCrema Seno 2\nRassodante\nAnti-smagliature";
    txtIntegratori.text = @"Antiossidante\nDrenante\nAnticellulite";
}


//// Trattamento Viso | Pelli Giovani (Post Trattamento Consigliato)
//- (void)selezione101 {
//    txtTrattamento.text = @"Lenitiva\nCrema Antirughe\nContorno Occhi\nAcido Jaluronico";
//}

//// Trattamento Viso | Pelli Medie (Post Trattamento Consigliato)
//- (void)selezione102 {
//    txtTrattamento.text = @"Lenitiva\nCrema Lifting Livello 1\nContorno Occhi Livello 1\nAcido Jaluronico Livello 1";
//}

//// Trattamento Viso | Pelli Mature (Post Trattamento Consigliato)
//- (void)selezione103 {
//    txtTrattamento.text = @"Lenitiva\nCrema Lifting Livello 2\nSiero Antimacchia\nContorno Occhi Livello 2\nAcido Jaluronico Livello 2";
//}


//// Trattamento Corpo / Pelli Giovani (Cosmetici Consigliati)
//- (void)selezione2010 {
//    txtTrattamento.text = @"Docciaschiuma\nCrema Seno\nRassodante\nAnti-smagliature";
//}

//// Trattamento Corpo / Pelli Medie (Cosmetici Consigliati)
//- (void)selezione2020 {
//    txtTrattamento.text = @"Docciaschiuma\nCrema Seno 1\nRassodante\nAnti-smagliature";
//}

//// Trattamento Corpo / Pelli Mature (Cosmetici Consigliati)
//- (void)selezione2030 {
//    txtTrattamento.text = @"Docciaschiuma\nCrema Seno 2\nRassodante\nAnti-smagliature";
//}

//// Trattamento Corpo / Pelli Giovani (Integratori Consigliati)
//- (void)selezione2001 {
//    txtIntegratori.text = @"Antiossidante\nDrenante\nAnticellulite";
//}

//// Trattamento Corpo / Pelli Medie (Integratori Consigliati)
//- (void)selezione2002 {
//    txtIntegratori.text = @"Antiossidante\nDrenante\nAnticellulite";
//}

//// Trattamento Corpo / Pelli Mature (Integratori Consigliati)
//- (void)selezione2003 {
//    txtIntegratori.text = @"Antiossidante\nDrenante\nAnticellulite";
//}

@end
