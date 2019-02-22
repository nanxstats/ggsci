# Generate internal color palettes data `R/sysdata.rda`
#
# [1] R Packages - Internal data. http://r-pkgs.had.co.nz/data.html#data-sysdata
# [2] Name that Color. http://chir.ag/projects/name-that-color/

ggsci_db <- vector("list")

# Discrete Color Palettes

# Color palette inspired by plots in Nature Reviews Cancer
ggsci_db$"npg"$"nrc" <- c(
  "Cinnabar" = "#E64B35", "Shakespeare" = "#4DBBD5",
  "PersianGreen" = "#00A087", "Chambray" = "#3C5488",
  "Apricot" = "#F39B7F", "WildBlueYonder" = "#8491B4",
  "MonteCarlo" = "#91D1C2", "Monza" = "#DC0000",
  "RomanCoffee" = "#7E6148", "Sandrift" = "#B09C85"
)

# Color palette inspired by plots in Science from AAAS
ggsci_db$"aaas"$"default" <- c(
  "Chambray" = "#3B4992", "Red" = "#EE0000",
  "FunGreen" = "#008B45", "HoneyFlower" = "#631879",
  "Teal" = "#008280", "Monza" = "#BB0021",
  "ButterflyBush" = "#5F559B", "FreshEggplant" = "#A20056",
  "Stack" = "#808180", "CodGray" = "#1B1919"
)

# Color palette inspired by plots in The New England Journal of Medicine
ggsci_db$"nejm"$"default" <- c(
  "TallPoppy" = "#BC3C29", "DeepCerulean" = "#0072B5",
  "Zest" = "#E18727", "Eucalyptus" = "#20854E",
  "WildBlueYonder" = "#7876B1", "Gothic" = "#6F99AD",
  "Salomie" = "#FFDC91", "FrenchRose" = "#EE4C97"
)

# Color palette inspired by plots in Lancet Oncology
ggsci_db$"lancet"$"lanonc" <- c(
  "CongressBlue" = "#00468B", "Red" = "#ED0000",
  "Apple" = "#42B540", "BondiBlue" = "#0099B4",
  "TrendyPink" = "#925E9F", "MonaLisa" = "#FDAF91",
  "Carmine" = "#AD002A", "Edward" = "#ADB6B6",
  "CodGray" = "#1B1919"
)

# Color palette inspired by plots in The Journal of the American Medical Association
ggsci_db$"jama"$"default" <- c(
  "Limed Spruce" = "#374E55", "Anzac" = "#DF8F44",
  "Cerulean" = "#00A1D5", "Apple Blossom" = "#B24745",
  "Acapulco" = "#79AF97", "Kimberly" = "#6A6599",
  "Makara" = "#80796B"
)

# Color palette inspired by plots in Journal of Clinical Oncology
ggsci_db$"jco"$"default" <- c(
  "Lochmara" = "#0073C2", "Corn" = "#EFC000",
  "Gray" = "#868686", "ChestnutRose" = "#CD534C",
  "Danube" = "#7AA6DC", "RegalBlue" = "#003C67",
  "Olive" = "#8F7700", "MineShaft" = "#3B3B3B",
  "WellRead" = "#A73030", "KashmirBlue" = "#4A6990"
)

# Color palette inspired by UCSC Genome Browser Chromosome Colors
ggsci_db$"ucscgb"$"default" <- c(
  "chr5" = "#FF0000", "chr8" = "#FF9900", "chr9" = "#FFCC00",
  "chr12" = "#00FF00", "chr15" = "#6699FF", "chr20" = "#CC33FF",
  "chr3" = "#99991E", "chrX" = "#999999", "chr6" = "#FF00CC",
  "chr4" = "#CC0000", "chr7" = "#FFCCCC", "chr10" = "#FFFF00",
  "chr11" = "#CCFF00", "chr13" = "#358000", "chr14" = "#0000CC",
  "chr16" = "#99CCFF", "chr17" = "#00FFFF", "chr18" = "#CCFFFF",
  "chr19" = "#9900CC", "chr21" = "#CC99FF", "chr1" = "#996600",
  "chr2" = "#666600", "chr22" = "#666666", "chrY" = "#CCCCCC",
  "chrUn" = "#79CC3D", "chrM" = "#CCCC99"
)

# Color palette inspired by D3.js
ggsci_db$"d3"$"category10" <- c(
  "Matisse" = "#1F77B4", "Flamenco" = "#FF7F0E",
  "ForestGreen" = "#2CA02C", "Punch" = "#D62728",
  "Wisteria" = "#9467BD", "SpicyMix" = "#8C564B",
  "Orchid" = "#E377C2", "Gray" = "#7F7F7F",
  "KeyLimePie" = "#BCBD22", "Java" = "#17BECF"
)

# Color palette inspired by D3.js
ggsci_db$"d3"$"category20" <- c(
  "Matisse" = "#1F77B4", "Flamenco" = "#FF7F0E",
  "ForestGreen" = "#2CA02C", "Punch" = "#D62728",
  "Wisteria" = "#9467BD", "SpicyMix" = "#8C564B",
  "Orchid" = "#E377C2", "Gray" = "#7F7F7F",
  "KeyLimePie" = "#BCBD22", "Java" = "#17BECF",
  "Spindle" = "#AEC7E8", "MaC" = "#FFBB78",
  "Feijoa" = "#98DF8A", "MonaLisa" = "#FF9896",
  "LavenderGray" = "#C5B0D5", "Quicksand" = "#C49C94",
  "Chantilly" = "#F7B6D2", "Silver" = "#C7C7C7",
  "Deco" = "#DBDB8D", "RegentStBlue" = "#9EDAE5"
)

# Color palette inspired by D3.js
ggsci_db$"d3"$"category20b" <- c(
  "EastBay" = "#393B79", "ChaletGreen" = "#637939",
  "Pesto" = "#8C6D31", "Lotus" = "#843C39",
  "CannonPink" = "#7B4173", "ButterflyBush" = "#5254A3",
  "ChelseaCucumber" = "#8CA252", "Tussock" = "#BD9E39",
  "AppleBlossom" = "#AD494A", "Tapestry" = "#A55194",
  "MoodyBlue" = "#6B6ECF", "WildWillow" = "#B5CF6B",
  "Ronchi" = "#E7BA52", "ChestnutRose" = "#D6616B",
  "Hopbush" = "#CE6DBD", "ColdPurple" = "#9C9EDE",
  "Deco" = "#CEDB9C", "Putty" = "#E7CB94",
  "TonysPink" = "#E7969C", "LightOrchid" = "#DE9ED6"
)

# Color palette inspired by D3.js
ggsci_db$"d3"$"category20c" <- c(
  "BostonBlue" = "#3182BD", "Christine" = "#E6550D",
  "SeaGreen" = "#31A354", "Deluge" = "#756BB1",
  "DoveGray" = "#636363", "Danube" = "#6BAED6",
  "NeonCarrot" = "#FD8D3C", "DeYork" = "#74C476",
  "BlueBell" = "#9E9AC8", "DustyGray" = "#969696",
  "RegentStBlue" = "#9ECAE1", "Koromiko" = "#FDAE6B",
  "MossGreen" = "#A1D99B", "LavenderGray" = "#BCBDDC",
  "Silver" = "#BDBDBD", "Spindle" = "#C6DBEF",
  "Flesh" = "#FDD0A2", "Celadon" = "#C7E9C0",
  "Snuff" = "#DADAEB", "Alto" = "#D9D9D9"
)

# Color palette inspired by IGV
ggsci_db$"igv"$"default" <- c(
  "chr1" = "#5050FF", "chr2" = "#CE3D32", "chr3" = "#749B58",
  "chr4" = "#F0E685", "chr5" = "#466983", "chr6" = "#BA6338",
  "chr7" = "#5DB1DD", "chr8" = "#802268", "chr9" = "#6BD76B",
  "chr10" = "#D595A7", "chr11" = "#924822", "chr12" = "#837B8D",
  "chr13" = "#C75127", "chr14" = "#D58F5C", "chr15" = "#7A65A5",
  "chr16" = "#E4AF69", "chr17" = "#3B1B53", "chr18" = "#CDDEB7",
  "chr19" = "#612A79", "chr20" = "#AE1F63", "chr21" = "#E7C76F",
  "chr22" = "#5A655E", "chrX" = "#CC9900", "chrY" = "#99CC00",
  "chrUn" = "#A9A9A9", "chr23" = "#CC9900", "chr24" = "#99CC00",
  "chr25" = "#33CC00", "chr26" = "#00CC33", "chr27" = "#00CC99",
  "chr28" = "#0099CC", "chr29" = "#0A47FF", "chr30" = "#4775FF",
  "chr31" = "#FFC20A", "chr32" = "#FFD147", "chr33" = "#990033",
  "chr34" = "#991A00", "chr35" = "#996600", "chr36" = "#809900",
  "chr37" = "#339900", "chr38" = "#00991A", "chr39" = "#009966",
  "chr40" = "#008099", "chr41" = "#003399", "chr42" = "#1A0099",
  "chr43" = "#660099", "chr44" = "#990080", "chr45" = "#D60047",
  "chr46" = "#FF1463", "chr47" = "#00D68F", "chr48" = "#14FFB1"
)

# Color palette inspired by IGV
ggsci_db$"igv"$"alternating" <- c(
  "Indigo" = "#5773CC", "SelectiveYellow" = "#FFB900"
)

# Color palette inspired by LocusZoom
ggsci_db$"locuszoom"$"default" <- c(
  "0.8to1.0" = "#D43F3A", "0.6to0.8" = "#EEA236",
  "0.4to0.6" = "#5CB85C", "0.2to0.4" = "#46B8DA",
  "0.0to0.2" = "#357EBD", "LDRefVar" = "#9632B8",
  "nodata" = "#B8B8B8"
)

# Color palette inspired by University of Chicago Color Palette
ggsci_db$"uchicago"$"default" <- c(
  "Maroon" = "#800000", "DarkGray" = "#767676",
  "Yellow" = "#FFA319", "LightGreen" = "#8A9045",
  "Blue" = "#155F83", "Orange" = "#C16622",
  "Red" = "#8F3931", "DarkGreen" = "#58593F",
  "Violet" = "#350E20"
)

# Color palette inspired by University of Chicago color palette (light version)
ggsci_db$"uchicago"$"light" <- c(
  "Maroon" = "#800000", "LightGray" = "#D6D6CE",
  "Yellow" = "#FFB547", "LightGreen" = "#ADB17D",
  "Blue" = "#5B8FA8", "Orange" = "#D49464",
  "Red" = "#B1746F", "DarkGreen" = "#8A8B79",
  "Violet" = "#725663"
)

# Color palette inspired by University of Chicago color palette (dark version)
ggsci_db$"uchicago"$"dark" <- c(
  "Maroon" = "#800000", "DarkGray" = "#767676",
  "Yellow" = "#CC8214", "LightGreen" = "#616530",
  "Blue" = "#0F425C", "Orange" = "#9A5324",
  "Red" = "#642822", "DarkGreen" = "#3E3E23",
  "Violet" = "#350E20"
)

# Color palette inspired by COSMIC Hallmarks of Cancer
ggsci_db$"cosmic"$"hallmarks" <- c(
  "Invasion and Metastasis" = "#171717",
  "Escaping Immunic Response to Cancer" = "#7D0226",
  "Change of Cellular Energetics" = "#300049",
  "Cell Replicative Immortality" = "#165459",
  "Suppression of Growth" = "#3F2327",
  "Genome Instability and Mutations" = "#0B1948",
  "Angiogenesis" = "#E71012",
  "Escaping Programmed Cell Death" = "#555555",
  "Proliferative Signaling" = "#193006",
  "Tumour Promoting Inflammation" = "#A8450C"
)

# Color palette inspired by COSMIC Hallmarks of Cancer
ggsci_db$"cosmic"$"signature_substitutions" <- c(
  "C>A" = "#5ABCEB",
  "C>G" = "#050708",
  "C>T" = "#D33C32",
  "T>A" = "#CBCACB",
  "T>C" = "#ABCD72",
  "T>G" = "#E7C9C6"
)

# Color palette inspired by The Simpsons
ggsci_db$"simpsons"$"springfield" <- c(
  "HomerYellow" = "#FED439", "HomerBlue" = "#709AE1",
  "HomerGrey" = "#8A9197", "HomerBrown" = "#D2AF81",
  "BartOrange" = "#FD7446", "MargeGreen" = "#D5E4A2",
  "MargeBlue" = "#197EC0", "LisaOrange" = "#F05C3B",
  "NedGreen" = "#46732E", "MaggieBlue" = "#71D0F5",
  "BurnsPurple" = "#370335", "BurnsGreen" = "#075149",
  "DuffRed" = "#C80813", "KentRed" = "#91331F",
  "BobGreen" = "#1A9993", "FrinkPink" = "#FD8CC1"
)

# Color palette inspired by Futurama
ggsci_db$"futurama"$"planetexpress" <- c(
  "FryOrange" = "#FF6F00", "FryRed" = "#C71000",
  "FryBlue" = "#008EA0", "LeelaPurple" = "#8A4198",
  "BenderIron" = "#5A9599", "ZoidbergRed" = "#FF6348",
  "ZoidbergBlue" = "#84D7E1", "AmyPink" = "#FF95A8",
  "HermesGreen" = "#3D3B25", "ProfessorBlue" = "#ADE2D0",
  "ScruffyGreen" = "#1A5354", "LeelaGrey" = "#3F4041"
)

# Color palette inspired by Rick and Morty
ggsci_db$"rickandmorty"$"schwifty" <- c(
  "MortyYellow" = "#FAFD7C", "MortyBrown" = "#82491E",
  "MortyBlue" = "#24325F", "RickBlue" = "#B7E4F9",
  "BethRed" = "#FB6467", "JerryGreen" = "#526E2D",
  "SummerPink" = "#E762D7", "SummerOrange" = "#E89242",
  "BethYellow" = "#FAE48B", "RickGreen" = "#A6EEE6",
  "RickBrown" = "#917C5D", "MeeseeksBlue" = "#69C8EC"
)

# Color palette inspired by Star Trek
ggsci_db$"startrek"$"uniform" <- c(
  "Engineering" = "#CC0C00", "Sciences" = "#5C88DA",
  "Senior" = "#84BD00", "Command" = "#FFCD00",
  "Teal" = "#7C878E", "Cerulean" = "#00B5E2",
  "Jade" = "#00AF66"
)

# Color palette inspired by Tron Legacy
ggsci_db$"tron"$"legacy" <- c(
  "BlackGuard" = "#FF410D", "Sam" = "#6EE2FF",
  "Clu" = "#F7C530", "Underclass" = "#95CC5E",
  "KevinFlynn" = "#D0DFE6", "CluFollower" = "#F79D1E",
  "Underclass2" = "#748AA6"
)

# Continuous Color Palettes

# Color palette inspired by heatmaps generated by GSEA GenePattern
ggsci_db$"gsea"$"default" <- c(
  "Purple" = "#4500AD", "DarkBlue" = "#2700D1",
  "RoyalBlue" = "#6B58EF", "Malibu" = "#8888FF",
  "Melrose" = "#C7C1FF", "Fog" = "#D5D5FF",
  "CottonCandy" = "#FFC0E5", "VividTangerine" = "#FF8989",
  "BrinkPink" = "#FF7080", "Persimmon" = "#FF5A5A",
  "Flamingo" = "#EF4040", "GuardsmanRed" = "#D60C00"
)

# Material Design color palettes
ggsci_db$"material"$"red" <- c(
  "Red50" = "#FFEBEE", "Red100" = "#FFCDD2",
  "Red200" = "#EF9A9A", "Red300" = "#E57373",
  "Red400" = "#EF5350", "Red500" = "#F44336",
  "Red600" = "#E53935", "Red700" = "#D32F2F",
  "Red800" = "#C62828", "Red900" = "#B71C1C"
)

ggsci_db$"material"$"pink" <- c(
  "Pink50" = "#FCE4EC", "Pink100" = "#F8BBD0",
  "Pink200" = "#F48FB1", "Pink300" = "#F06292",
  "Pink400" = "#EC407A", "Pink500" = "#E91E63",
  "Pink600" = "#D81B60", "Pink700" = "#C2185B",
  "Pink800" = "#AD1457", "Pink900" = "#880E4F"
)

ggsci_db$"material"$"purple" <- c(
  "Purple50" = "#F3E5F5", "Purple100" = "#E1BEE7",
  "Purple200" = "#CE93D8", "Purple300" = "#BA68C8",
  "Purple400" = "#AB47BC", "Purple500" = "#9C27B0",
  "Purple600" = "#8E24AA", "Purple700" = "#7B1FA2",
  "Purple800" = "#6A1B9A", "Purple900" = "#4A148C"
)

ggsci_db$"material"$"deep-purple" <- c(
  "DeepPurple50" = "#EDE7F6", "DeepPurple100" = "#D1C4E9",
  "DeepPurple200" = "#B39DDB", "DeepPurple300" = "#9575CD",
  "DeepPurple400" = "#7E57C2", "DeepPurple500" = "#673AB7",
  "DeepPurple600" = "#5E35B1", "DeepPurple700" = "#512DA8",
  "DeepPurple800" = "#4527A0", "DeepPurple900" = "#311B92"
)

ggsci_db$"material"$"indigo" <- c(
  "Indigo50" = "#E8EAF6", "Indigo100" = "#C5CAE9",
  "Indigo200" = "#9FA8DA", "Indigo300" = "#7986CB",
  "Indigo400" = "#5C6BC0", "Indigo500" = "#3F51B5",
  "Indigo600" = "#3949AB", "Indigo700" = "#303F9F",
  "Indigo800" = "#283593", "Indigo900" = "#1A237E"
)

ggsci_db$"material"$"blue" <- c(
  "Blue50" = "#E3F2FD", "Blue100" = "#BBDEFB",
  "Blue200" = "#90CAF9", "Blue300" = "#64B5F6",
  "Blue400" = "#42A5F5", "Blue500" = "#2196F3",
  "Blue600" = "#1E88E5", "Blue700" = "#1976D2",
  "Blue800" = "#1565C0", "Blue900" = "#0D47A1"
)

ggsci_db$"material"$"light-blue" <- c(
  "LightBlue50" = "#E1F5FE", "LightBlue100" = "#B3E5FC",
  "LightBlue200" = "#81D4FA", "LightBlue300" = "#4FC3F7",
  "LightBlue400" = "#29B6F6", "LightBlue500" = "#03A9F4",
  "LightBlue600" = "#039BE5", "LightBlue700" = "#0288D1",
  "LightBlue800" = "#0277BD", "LightBlue900" = "#01579B"
)

ggsci_db$"material"$"cyan" <- c(
  "Cyan50" = "#E0F7FA", "Cyan100" = "#B2EBF2",
  "Cyan200" = "#80DEEA", "Cyan300" = "#4DD0E1",
  "Cyan400" = "#26C6DA", "Cyan500" = "#00BCD4",
  "Cyan600" = "#00ACC1", "Cyan700" = "#0097A7",
  "Cyan800" = "#00838F", "Cyan900" = "#006064"
)

ggsci_db$"material"$"teal" <- c(
  "Teal50" = "#E0F2F1", "Teal100" = "#B2DFDB",
  "Teal200" = "#80CBC4", "Teal300" = "#4DB6AC",
  "Teal400" = "#26A69A", "Teal500" = "#009688",
  "Teal600" = "#00897B", "Teal700" = "#00796B",
  "Teal800" = "#00695C", "Teal900" = "#004D40"
)

ggsci_db$"material"$"green" <- c(
  "Green50" = "#E8F5E9", "Green100" = "#C8E6C9",
  "Green200" = "#A5D6A7", "Green300" = "#81C784",
  "Green400" = "#66BB6A", "Green500" = "#4CAF50",
  "Green600" = "#43A047", "Green700" = "#388E3C",
  "Green800" = "#2E7D32", "Green900" = "#1B5E20"
)

ggsci_db$"material"$"light-green" <- c(
  "LightGreen50" = "#F1F8E9", "LightGreen100" = "#DCEDC8",
  "LightGreen200" = "#C5E1A5", "LightGreen300" = "#AED581",
  "LightGreen400" = "#9CCC65", "LightGreen500" = "#8BC34A",
  "LightGreen600" = "#7CB342", "LightGreen700" = "#689F38",
  "LightGreen800" = "#558B2F", "LightGreen900" = "#33691E"
)

ggsci_db$"material"$"lime" <- c(
  "Lime50" = "#F9FBE7", "Lime100" = "#F0F4C3",
  "Lime200" = "#E6EE9C", "Lime300" = "#DCE775",
  "Lime400" = "#D4E157", "Lime500" = "#CDDC39",
  "Lime600" = "#C0CA33", "Lime700" = "#AFB42B",
  "Lime800" = "#9E9D24", "Lime900" = "#827717"
)

ggsci_db$"material"$"yellow" <- c(
  "Yellow50" = "#FFFDE7", "Yellow100" = "#FFF9C4",
  "Yellow200" = "#FFF59D", "Yellow300" = "#FFF176",
  "Yellow400" = "#FFEE58", "Yellow500" = "#FFEB3B",
  "Yellow600" = "#FDD835", "Yellow700" = "#FBC02D",
  "Yellow800" = "#F9A825", "Yellow900" = "#F57F17"
)

ggsci_db$"material"$"amber" <- c(
  "Amber50" = "#FFF8E1", "Amber100" = "#FFECB3",
  "Amber200" = "#FFE082", "Amber300" = "#FFD54F",
  "Amber400" = "#FFCA28", "Amber500" = "#FFC107",
  "Amber600" = "#FFB300", "Amber700" = "#FFA000",
  "Amber800" = "#FF8F00", "Amber900" = "#FF6F00"
)

ggsci_db$"material"$"orange" <- c(
  "Orange50" = "#FFF3E0", "Orange100" = "#FFE0B2",
  "Orange200" = "#FFCC80", "Orange300" = "#FFB74D",
  "Orange400" = "#FFA726", "Orange500" = "#FF9800",
  "Orange600" = "#FB8C00", "Orange700" = "#F57C00",
  "Orange800" = "#EF6C00", "Orange900" = "#E65100"
)

ggsci_db$"material"$"deep-orange" <- c(
  "DeepOrange50" = "#FBE9E7", "DeepOrange100" = "#FFCCBC",
  "DeepOrange200" = "#FFAB91", "DeepOrange300" = "#FF8A65",
  "DeepOrange400" = "#FF7043", "DeepOrange500" = "#FF5722",
  "DeepOrange600" = "#F4511E", "DeepOrange700" = "#E64A19",
  "DeepOrange800" = "#D84315", "DeepOrange900" = "#BF360C"
)

ggsci_db$"material"$"brown" <- c(
  "Brown50" = "#EFEBE9", "Brown100" = "#D7CCC8",
  "Brown200" = "#BCAAA4", "Brown300" = "#A1887F",
  "Brown400" = "#8D6E63", "Brown500" = "#795548",
  "Brown600" = "#6D4C41", "Brown700" = "#5D4037",
  "Brown800" = "#4E342E", "Brown900" = "#3E2723"
)

ggsci_db$"material"$"grey" <- c(
  "Grey50" = "#FAFAFA", "Grey100" = "#F5F5F5",
  "Grey200" = "#EEEEEE", "Grey300" = "#E0E0E0",
  "Grey400" = "#BDBDBD", "Grey500" = "#9E9E9E",
  "Grey600" = "#757575", "Grey700" = "#616161",
  "Grey800" = "#424242", "Grey900" = "#212121"
)

ggsci_db$"material"$"blue-grey" <- c(
  "BlueGrey50" = "#ECEFF1", "BlueGrey100" = "#CFD8DC",
  "BlueGrey200" = "#B0BEC5", "BlueGrey300" = "#90A4AE",
  "BlueGrey400" = "#78909C", "BlueGrey500" = "#607D8B",
  "BlueGrey600" = "#546E7A", "BlueGrey700" = "#455A64",
  "BlueGrey800" = "#37474F", "BlueGrey900" = "#263238"
)

save(ggsci_db, file = "R/sysdata.rda")

# barplot(rep(1, 10), col = ggsci_db$"npg"$"nrc")
# barplot(rep(1, 10), col = ggsci_db$"aaas"$"default")
# barplot(rep(1, 8), col = ggsci_db$"nejm"$"default")
# barplot(rep(1, 9), col = ggsci_db$"lancet"$"lanonc")
# barplot(rep(1, 7), col = ggsci_db$"jama"$"default")
# barplot(rep(1, 10), col = ggsci_db$"jco"$"default")
# barplot(rep(1, 26), col = ggsci_db$"ucscgb"$"default")
# barplot(rep(1, 10), col = ggsci_db$"d3"$"category10")
# barplot(rep(1, 20), col = ggsci_db$"d3"$"category20")
# barplot(rep(1, 20), col = ggsci_db$"d3"$"category20b")
# barplot(rep(1, 20), col = ggsci_db$"d3"$"category20c")
# barplot(rep(1, 7), col = ggsci_db$"locuszoom"$"default")
# barplot(rep(1, 51), col = ggsci_db$"igv"$"default")
# barplot(rep(1, 2), col = ggsci_db$"igv"$"alternating")
# barplot(rep(1, 9), col = ggsci_db$"uchicago"$"default")
# barplot(rep(1, 9), col = ggsci_db$"uchicago"$"light")
# barplot(rep(1, 9), col = ggsci_db$"uchicago"$"dark")
# barplot(rep(1, 7), col = ggsci_db$"startrek"$"uniform")
# barplot(rep(1, 7), col = ggsci_db$"tron"$"legacy")
# barplot(rep(1, 12), col = ggsci_db$"futurama"$"planetexpress")
# barplot(rep(1, 12), col = ggsci_db$"rickandmorty"$"schwifty")
# barplot(rep(1, 16), col = ggsci_db$"simpsons"$"springfield")
# barplot(rep(1, 12), col = ggsci_db$"gsea"$"default")
# barplot(rep(1, 10), col = ggsci_db$"material"$"red")
# barplot(rep(1, 10), col = ggsci_db$"material"$"pink")
# barplot(rep(1, 10), col = ggsci_db$"material"$"purple")
# barplot(rep(1, 10), col = ggsci_db$"material"$"deep-purple")
# barplot(rep(1, 10), col = ggsci_db$"material"$"indigo")
# barplot(rep(1, 10), col = ggsci_db$"material"$"blue")
# barplot(rep(1, 10), col = ggsci_db$"material"$"light-blue")
# barplot(rep(1, 10), col = ggsci_db$"material"$"cyan")
# barplot(rep(1, 10), col = ggsci_db$"material"$"teal")
# barplot(rep(1, 10), col = ggsci_db$"material"$"green")
# barplot(rep(1, 10), col = ggsci_db$"material"$"light-green")
# barplot(rep(1, 10), col = ggsci_db$"material"$"lime")
# barplot(rep(1, 10), col = ggsci_db$"material"$"yellow")
# barplot(rep(1, 10), col = ggsci_db$"material"$"amber")
# barplot(rep(1, 10), col = ggsci_db$"material"$"orange")
# barplot(rep(1, 10), col = ggsci_db$"material"$"deep-orange")
# barplot(rep(1, 10), col = ggsci_db$"material"$"brown")
# barplot(rep(1, 10), col = ggsci_db$"material"$"grey")
# barplot(rep(1, 10), col = ggsci_db$"material"$"blue-grey")
