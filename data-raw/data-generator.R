# Generate internal color palettes data `R/sysdata.rda`
#
# [1] R Packages - Internal data. http://r-pkgs.had.co.nz/data.html#data-sysdata
# [2] Name that Color. http://chir.ag/projects/name-that-color/

ggsci_db = vector('list')

# Discrete Color Palettes

# Color palette inspired by plots in Nature Reviews Cancer
ggsci_db$'npg'$'nrc' =
  c('Cinnabar'     = '#E64B35', 'Shakespeare'    = '#4DBBD5',
    'PersianGreen' = '#00A087', 'Chambray'       = '#3C5488',
    'Apricot'      = '#F39B7F', 'WildBlueYonder' = '#8491B4',
    'MonteCarlo'   = '#91D1C2', 'Monza'          = '#DC0000',
    'RomanCoffee'  = '#7E6148', 'Sandrift'       = '#B09C85')

# Color palette inspired by plots in Science from AAAS
ggsci_db$'aaas'$'default' =
  c('Chambray'      = '#3B4992', 'Red'           = '#EE0000',
    'FunGreen'      = '#008B45', 'HoneyFlower'   = '#631879',
    'Teal'          = '#008280', 'Monza'         = '#BB0021',
    'ButterflyBush' = '#5F559B', 'FreshEggplant' = '#A20056',
    'Stack'         = '#808180', 'CodGray'       = '#1B1919')

# Color palette inspired by plots in Lancet Oncology
ggsci_db$'lancet'$'lanonc' =
  c('CongressBlue' = '#00468B', 'Red'       = '#ED0000',
    'Apple'        = '#42B540', 'BondiBlue' = '#0099B4',
    'TrendyPink'   = '#925E9F', 'MonaLisa'  = '#FDAF91',
    'Carmine'      = '#AD002A', 'Edward'    = '#ADB6B6',
    'CodGray'      = '#1B1919')

# Color palette inspired by plots in Journal of Clinical Oncology
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

# Color palette inspired by D3.js
ggsci_db$'d3'$'category10' =
  c('Matisse'     = '#1F77B4', 'Flamenco' = '#FF7F0E',
    'ForestGreen' = '#2CA02C', 'Punch'    = '#D62728',
    'Wisteria'    = '#9467BD', 'SpicyMix' = '#8C564B',
    'Orchid'      = '#E377C2', 'Gray'     = '#7F7F7F',
    'KeyLimePie'  = '#BCBD22', 'Java'     = '#17BECF')

# Color palette inspired by D3.js
ggsci_db$'d3'$'category20' =
  c('Matisse'      = '#1F77B4', 'Flamenco'     = '#FF7F0E',
    'ForestGreen'  = '#2CA02C', 'Punch'        = '#D62728',
    'Wisteria'     = '#9467BD', 'SpicyMix'     = '#8C564B',
    'Orchid'       = '#E377C2', 'Gray'         = '#7F7F7F',
    'KeyLimePie'   = '#BCBD22', 'Java'         = '#17BECF',
    'Spindle'      = '#AEC7E8', 'MaC'          = '#FFBB78',
    'Feijoa'       = '#98DF8A', 'MonaLisa'     = '#FF9896',
    'LavenderGray' = '#C5B0D5', 'Quicksand'    = '#C49C94',
    'Chantilly'    = '#F7B6D2', 'Silver'       = '#C7C7C7',
    'Deco'         = '#DBDB8D', 'RegentStBlue' = '#9EDAE5')

# Color palette inspired by D3.js
ggsci_db$'d3'$'category20b' =
  c('EastBay'         = '#393B79', 'ChaletGreen'   = '#637939',
    'Pesto'           = '#8C6D31', 'Lotus'         = '#843C39',
    'CannonPink'      = '#7B4173', 'ButterflyBush' = '#5254A3',
    'ChelseaCucumber' = '#8CA252', 'Tussock'       = '#BD9E39',
    'AppleBlossom'    = '#AD494A', 'Tapestry'      = '#A55194',
    'MoodyBlue'       = '#6B6ECF', 'WildWillow'    = '#B5CF6B',
    'Ronchi'          = '#E7BA52', 'ChestnutRose'  = '#D6616B',
    'Hopbush'         = '#CE6DBD', 'ColdPurple'    = '#9C9EDE',
    'Deco'            = '#CEDB9C', 'Putty'         = '#E7CB94',
    'TonysPink'       = '#E7969C', 'LightOrchid'   = '#DE9ED6')

# Color palette inspired by D3.js
ggsci_db$'d3'$'category20c' =
  c('BostonBlue'   = '#3182BD', 'Christine'    = '#E6550D',
    'SeaGreen'     = '#31A354', 'Deluge'       = '#756BB1',
    'DoveGray'     = '#636363', 'Danube'       = '#6BAED6',
    'NeonCarrot'   = '#FD8D3C', 'DeYork'       = '#74C476',
    'BlueBell'     = '#9E9AC8', 'DustyGray'    = '#969696',
    'RegentStBlue' = '#9ECAE1', 'Koromiko'     = '#FDAE6B',
    'MossGreen'    = '#A1D99B', 'LavenderGray' = '#BCBDDC',
    'Silver'       = '#BDBDBD', 'Spindle'      = '#C6DBEF',
    'Flesh'        = '#FDD0A2', 'Celadon'      = '#C7E9C0',
    'Snuff'        = '#DADAEB', 'Alto'         = '#D9D9D9')

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

# Color palette inspired by Futurama
ggsci_db$'futurama'$'planetexpress' =
  c('FryOrange'    = '#FF6F00', 'FryRed'        = '#C71000',
    'FryBlue'      = '#008EA0', 'LeelaPurple'   = '#8A4198',
    'BenderIron'   = '#5A9599', 'ZoidbergRed'   = '#FF6348',
    'ZoidbergBlue' = '#84D7E1', 'AmyPink'       = '#FF95A8',
    'HermesGreen'  = '#3D3B25', 'ProfessorBlue' = '#ADE2D0',
    'ScruffyGreen' = '#1A5354', 'LeelaGrey'     = '#3F4041')

# Color palette inspired by Rick and Morty
ggsci_db$'rickandmorty'$'schwifty' =
  c('MortyYellow' = '#FAFD7C', 'MortyBrown'   = '#82491E',
    'MortyBlue'   = '#24325F', 'RickBlue'     = '#B7E4F9',
    'BethRed'     = '#FB6467', 'JerryGreen'   = '#526E2D',
    'SummerPink'  = '#E762D7', 'SummerOrange' = '#E89242',
    'BethYellow'  = '#FAE48B', 'RickGreen'    = '#A6EEE6',
    'RickBrown'   = '#917C5D', 'MeeseeksBlue' = '#69C8EC')

# Continuous Color Palettes

# Color palette inspired by heatmaps generated by GSEA GenePattern
ggsci_db$'gsea'$'default' =
  c('Purple'      = '#4500AD', 'DarkBlue'       = '#2700D1',
    'RoyalBlue'   = '#6B58EF', 'Malibu'         = '#8888FF',
    'Melrose'     = '#C7C1FF', 'Fog'            = '#D5D5FF',
    'CottonCandy' = '#FFC0E5', 'VividTangerine' = '#FF8989',
    'BrinkPink'   = '#FF7080', 'Persimmon'      = '#FF5A5A',
    'Flamingo'    = '#EF4040', 'GuardsmanRed'   = '#D60C00')

save(ggsci_db, file = 'R/sysdata.rda')

# barplot(rep(1, 10), col = ggsci_db$'npg'$'nrc')
# barplot(rep(1, 10), col = ggsci_db$'aaas'$'default')
# barplot(rep(1, 9),  col = ggsci_db$'lancet'$'lanonc')
# barplot(rep(1, 10), col = ggsci_db$'jco'$'default')
# barplot(rep(1, 26), col = ggsci_db$'ucscgb'$'default')
# barplot(rep(1, 10), col = ggsci_db$'d3'$'category10')
# barplot(rep(1, 20), col = ggsci_db$'d3'$'category20')
# barplot(rep(1, 20), col = ggsci_db$'d3'$'category20b')
# barplot(rep(1, 20), col = ggsci_db$'d3'$'category20c')
# barplot(rep(1, 9),  col = ggsci_db$'uchicago'$'default')
# barplot(rep(1, 9),  col = ggsci_db$'uchicago'$'light')
# barplot(rep(1, 9),  col = ggsci_db$'uchicago'$'dark')
# barplot(rep(1, 16), col = ggsci_db$'simpsons'$'springfield')
# barplot(rep(1, 12), col = ggsci_db$'futurama'$'planetexpress')
# barplot(rep(1, 12), col = ggsci_db$'rickandmorty'$'schwifty')
# barplot(rep(1, 12), col = ggsci_db$'gsea'$'default')
