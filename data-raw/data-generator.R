# Generate internal color palettes data `R/sysdata.rda`
#
# [1] R Packages - Internal data. http://r-pkgs.had.co.nz/data.html#data-sysdata
# [2] Name that Color. http://chir.ag/projects/name-that-color/

ggsci_db = vector('list')

# Color palette inspired by Nature Reviews Cancer
ggsci_db$'npg'$'nrc' =
  c('Cinnabar'     = '#E64B35', 'Shakespeare'    = '#4DBBD5',
    'PersianGreen' = '#00A087', 'Chambray'       = '#3C5488',
    'Apricot'      = '#F39B7F', 'WildBlueYonder' = '#8491B4',
    'MonteCarlo'   = '#91D1C2', 'Monza'          = '#DC0000',
    'RomanCoffee'  = '#7E6148', 'Sandrift'       = '#B09C85')

# Color palette inspired by Science from AAAS
ggsci_db$'aaas'$'default' =
  c('Chambray'      = '#3B4992', 'Red'           = '#EE0000',
    'FunGreen'      = '#008B45', 'HoneyFlower'   = '#631879',
    'Teal'          = '#008280', 'Monza'         = '#BB0021',
    'ButterflyBush' = '#5F559B', 'FreshEggplant' = '#A20056',
    'Stack'         = '#808180', 'CodGray'       = '#1B1919')

# Color palette inspired by The Lancet Oncology
ggsci_db$'lancet'$'lanonc' =
  c('CongressBlue' = '#00468B', 'Red'       = '#ED0000',
    'Apple'        = '#42B540', 'BondiBlue' = '#0099B4',
    'TrendyPink'   = '#925E9F', 'MonaLisa'  = '#FDAF91',
    'Carmine'      = '#AD002A', 'Edward'    = '#ADB6B6',
    'CodGray'      = '#1B1919')

# Color palette inspired by Journal of Clinical Oncology
ggsci_db$'jco'$'default' =
  c('Lochmara' = '#0073C2', 'Corn'         = '#EFC000',
    'Gray'     = '#868686', 'ChestnutRose' = '#CD534C',
    'Danube'   = '#7AA6DC', 'RegalBlue'    = '#003C67',
    'Olive'    = '#8F7700', 'MineShaft'    = '#3B3B3B',
    'WellRead' = '#A73030', 'KashmirBlue'  = '#4A6990')

# Color palette inspired by UCSC Genome Browser Chromosome Colors
ggsci_db$'ucscgb'$'default' =
  c('chr5'  = '#FF0000', 'chr8'  = '#FF9900', 'chr9'  = '#FFCC00',
    'chr12' = '#00FF00', 'chr15' = '#6699FF', 'chr20' = '#CC33FF',
    'chr3'  = '#99991E', 'chrX'  = '#999999', 'chr6'  = '#FF00CC',
    'chr4'  = '#CC0000', 'chr7'  = '#FFCCCC', 'chr10' = '#FFFF00',
    'chr11' = '#CCFF00', 'chr13' = '#358000', 'chr14' = '#0000CC',
    'chr16' = '#99CCFF', 'chr17' = '#00FFFF', 'chr18' = '#CCFFFF',
    'chr19' = '#9900CC', 'chr21' = '#CC99FF', 'chr1'  = '#996600',
    'chr2'  = '#666600', 'chr22' = '#666666', 'chrY'  = '#CCCCCC',
    'chrUn' = '#79CC3D', 'chrM'  = '#CCCC99')

# Color palette inspired by University of Chicago Color Palette
ggsci_db$'uchicago'$'default' =
  c('Maroon' = '#800000', 'DarkGray'   = '#767676',
    'Yellow' = '#FFA319', 'LightGreen' = '#8A9045',
    'Blue'   = '#155F83', 'Orange'     = '#C16622',
    'Red'    = '#8F3931', 'DarkGreen'  = '#58593F',
    'Violet' = '#350E20')

# Color palette inspired by University of Chicago color palette (light version)
ggsci_db$'uchicago'$'light' =
  c('Maroon' = '#800000', 'LightGray'  = '#D6D6CE',
    'Yellow' = '#FFB547', 'LightGreen' = '#ADB17D',
    'Blue'   = '#5B8FA8', 'Orange'     = '#D49464',
    'Red'    = '#B1746F', 'DarkGreen'  = '#8A8B79',
    'Violet' = '#725663')

# Color palette inspired by University of Chicago color palette (dark version)
ggsci_db$'uchicago'$'dark' =
  c('Maroon' = '#800000', 'DarkGray'   = '#767676',
    'Yellow' = '#CC8214', 'LightGreen' = '#616530',
    'Blue'   = '#0F425C', 'Orange'     = '#9A5324',
    'Red'    = '#642822', 'DarkGreen'  = '#3E3E23',
    'Violet' = '#350E20')

# Color palette inspired by The Simpsons
ggsci_db$'simpsons'$'springfield' =
  c('HomerYellow' = '#FED439', 'HomerBlue'  = '#709AE1',
    'HomerGrey'   = '#8A9197', 'HomerBrown' = '#D2AF81',
    'BartOrange'  = '#FD7446', 'MargeGreen' = '#D5E4A2',
    'MargeBlue'   = '#197EC0', 'LisaOrange' = '#F05C3B',
    'NedGreen'    = '#46732E', 'MaggieBlue' = '#71D0F5',
    'BurnsPurple' = '#370335', 'BurnsGreen' = '#075149',
    'DuffRed'     = '#C80813', 'KentRed'    = '#91331F',
    'BobGreen'    = '#1A9993', 'FrinkPink'  = '#FD8CC1')

ggsci_db$'rickandmorty'$'schwifty' =
  c('MortyYellow' = '#FAFD7C', 'MortyBrown'   = '#82491E',
    'MortyBlue'   = '#24325F', 'RickBlue'     = '#B7E4F9',
    'BethRed'     = '#FB6467', 'JerryGreen'   = '#526E2D',
    'SummerPink'  = '#E762D7', 'SummerOrange' = '#E89242',
    'BethYellow'  = '#fAE48B', 'RickGreen'    = '#A6EEE6',
    'RickBrown'   = '#917C5D', 'MeeseeksBlue' = '#69C8EC')

save(ggsci_db, file = 'R/sysdata.rda')

# barplot(rep(1, 10), col = ggsci_db$'npg'$'nrc')
# barplot(rep(1, 10), col = ggsci_db$'aaas'$'default')
# barplot(rep(1, 9),  col = ggsci_db$'lancet'$'lanonc')
# barplot(rep(1, 10), col = ggsci_db$'jco'$'default')
# barplot(rep(1, 26), col = ggsci_db$'ucscgb'$'default')
# barplot(rep(1, 9),  col = ggsci_db$'uchicago'$'default')
# barplot(rep(1, 9),  col = ggsci_db$'uchicago'$'light')
# barplot(rep(1, 9),  col = ggsci_db$'uchicago'$'dark')
# barplot(rep(1, 16), col = ggsci_db$'simpsons'$'default')
# barplot(rep(1, 12), col = ggsci_db$'rickandmorty'$'schwifty')
