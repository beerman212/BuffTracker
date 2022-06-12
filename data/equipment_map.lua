enfeebling_modifiers = {
    -- Default augment assumes max
    [11108] = {saboteur=0.10}, -- Estoqueur's Gantherots +2
    [11208] = {saboteur=0.05}, -- Estoqueur's Gantherots +1
    [25441] = {augment=0.15}, -- Duelist's Torque
    [25442] = {augment=0.2}, -- Duelist's Torque +1
    [25443] = {augment=0.25}, -- Duelist's Torque +2
    [25827] = {0.2}, -- Regal Cuffs
    [26109] = {0.1}, -- Snotra Earring
    [26188] = {0.1}, -- Kishar Ring
    [26363] = {0.05}, -- Obstinate Sash
    [27060] = {saboteur=0.11}, -- Lethargy Gantherots
    [27061] = {saboteur=0.12}, -- Lethargy Gantherots +1
}

resist_state_modifiers = {
    [0] = 1,
    [1] = 0.5,
    [2] = 0.25,
    [3] = 0.125,
}


enhancing_modifiers = {
    -- Default augment assumes max
    [11123] = {perpetuance=0.50}, -- Savant's Bracers +2
    [11223] = {perpetuance=0.25}, -- Savant's Bracers +1
    [11148] = {0.2}, -- Estoqueur's Houseaux +2
    [11248] = {0.1}, -- Estoqueur's Houseaux +1
    [16204] = {0.1}, -- Estoqueur's Cape
    [20677] = {augment=0.04}, -- Colada
    [21072] = {augment=0.06}, -- Gada
    [22054] = {augment=0.1}, -- Grioavolr
    [22055] = {0.1}, -- Oranyan
    [22097] = {0.1}, -- Argute Staff
    [22098] = {0.15}, -- Pedagogy Staff
    [22099] = {0.2}, -- Musa
    [23134] = {0.1}, -- Vitiation Tabard +2
    [23149] = {0.08}, -- Pedagogy Gown +2
    [23178] = {0.18}, -- Atrophy Gloves +2
    [23285] = {0.25}, -- Futhark Trousers +2
    [23469] = {0.15}, -- Vitiation Tabard +3
    [23484] = {0.12}, -- Pedagogy Gown +3
    [23513] = {0.2}, -- Atrophy Gloves +3
    [23620] = {0.3}, -- Futhark Trousers +3
    [25441] = {augment=0.15}, -- Duelist's Torque
    [25442] = {augment=0.2}, -- Duelist's Torque +1
    [25443] = {augment=0.25}, -- Duelist's Torque +2
    [26041] = {-0.5}, -- Sroda Necklace
    [26250] = {0.2}, -- Sucellos's Cape
    [26354] = {0.1}, -- Embla Sash
    [26419] = {0.1}, -- Ammurapi Shield
    [26736] = {augment=0.1}, -- Telchine Cap
    [26782] = {0.1}, -- Erilaz Galea
    [26783] = {0.15}, -- Erilaz Galea +1
    [26894] = {augment=0.1,Regen=12}, -- Telchine Chasuble
    [27048] = {augment=0.1}, -- Telchine Gloves
    [27090] = {perpetuance=0.50}, -- Arbatel Bracers
    [27091] = {perpetuance=0.55}, -- Arbatel Bracers +1
    [27194] = {0.1}, -- Futhark Trousers
    [27195] = {0.2}, -- Futhark Trousers +1
    [27235] = {augment=0.1}, -- Telchine Braconi
    [27405] = {augment=0.1}, -- Telchine Pigaches
    [27419] = {0.25}, -- Lethargy Houseaux
    [27420] = {0.3}, -- Lethargy Houseaux +1
    [27639] = {augment_received=0.1}, -- Ajax +1
    [27947] = {0.15}, -- Atrophy Gloves
    [27968] = {0.16}, -- Atrophy Gloves +1
    [28621] = {augment=0.2}, -- Ghostfyre Cape
    [28638] = {embolden=0.15}, -- Evasionist's Cape -- Default augment assumes max
}

composure_modifiers = {
    [2] = 0.1,
    [3] = 0.2,
    [4] = 0.35,
    [5] = 0.5
}

song_modifiers = {
    -- Song +
    [11073] =  {madrigal=0.1}, -- aoidos' calot +2
    [11093] =  {minuet=0.1}, -- aoidos' hongreline +2
    [11113] =  {march=0.1}, -- aoidos' manchettes +2
    [11133] =  {ballad=0.1}, -- aoidos' rhingrave +2
    [11153] =  {scherzo=0.1}, -- aoidos' cothurnes +2
    [17344] =  {minuet=0.1}, -- cornette
    [17346] =  {requiem=0.2}, -- siren flute
    [17347] =  {threnody=0.1}, -- piccolo
    [17348] =  {madrigal=0.1}, -- traversiere
    [17349] =  {march=0.2}, -- faerie piccolo
    [17350] =  {prelude=0.1}, -- angel's flute
    [17351] =  {mambo=0.1}, -- gemshorn
    [17352] =  {elegy=0.1}, -- horn
    [17354] =  {minne=0.1}, -- harp
    [17360] =  {march=0.3,etude=0.3}, -- langeleik
    [17361] =  {carol=0.1}, -- crumhorn
    [17362] =  {requiem=0.2}, -- shofar
    [17363] =  {hymnus=0.3,scherzo=0.1}, -- mass chalemie
    [17366] =  {lullaby=0.1}, -- Mary's horn
    [17367] =  {march=0.1}, -- Royal Spearman's horn
    [17368] =  {threnody=0.2}, -- piccolo +1
    [17369] =  {minuet=0.2}, -- cornette +1
    [17370] =  {mambo=0.2}, -- gemshorn +1
    [17371] =  {elegy=0.2}, -- horn +1
    [17372] =  {requiem=0.1}, -- flute +1
    [17373] =  {minne=0.1}, -- maple harp +1
    [17374] =  {minne=0.2}, -- harp +1
    [17375] =  {madrigal=0.2}, -- traversiere +1
    [17377] =  {carol=0.2}, -- crumhorn +1
    [17378] =  {prelude=0.2}, -- angel's flute +1
    [17379] =  {requiem=0.2}, -- Hamelin flute
    [17832] =  {requiem=0.3}, -- shofar +1
    [17835] =  {march=0.1}, -- San d'Orian horn
    [17836] =  {march=0.1}, -- Kingdom horn
    [17838] =  {mazurka=0.2}, -- harlequin's horn
    [17839] =  {finale=0.2}, -- military harp
    [17840] =  {hymnus=0.2}, -- angel lyre
    [17841] =  {lullaby=0.2}, -- nursemaid's harp
    [17842] =  {threnody=0.3}, -- sorrowful harp
    [17844] =  {requiem=0.1}, -- flute +2
    [17845] =  {madrigal=0.2}, -- traversiere +2
    [17846] =  {minuet=0.2}, -- cornette +2
    [17847] =  {carol=0.2}, -- crumhorn +2
    [17849] =  {mambo=0.1}, -- hellish bugle
    [17850] =  {mambo=0.2}, -- hellish bugle +1
    [17851] =  {assault_ballad=0.1}, -- storm fife
    [17852] =  {requiem=0.4}, -- requiem flute
    [17853] =  {march=0.2}, -- Iron Ram horn
    [17854] =  {lullaby=0.2}, -- cradle horn
    [17855] =  {finale=0.2}, -- ney
    [17856] =  {elegy=0.3,minne=0.3}, -- syrinx
    [18341] =  {dynamis_all_songs=0.2}, -- millennium horn
    [18342] =  {all_songs=0.2}, -- Gjallarhorn
    [18343] =  {finale=0.3,lullaby=0.3}, -- Pan's horn
    [18572] =  {all_songs=0.4}, -- Gjallarhorn
    [18577] =  {all_songs=0.2}, -- Gjallarhorn
    [18578] =  {all_songs=0.2}, -- Gjallarhorn
    [18579] =  {all_songs=0.3}, -- Gjallarhorn
    [18580] =  {all_songs=0.3}, -- Gjallarhorn
    [18831] =  {ballad=0.1}, -- crooner's cithara
    [18832] =  {minuet=0.3}, -- apollo's flute
    [18833] =  {madrigal=0.3,prelude=0.3}, -- cantabank's horn
    [18834] =  {mambo=0.3,mazurka=0.3}, -- vihuela
    [18840] =  {all_songs=0.4}, -- Gjallarhorn
    [21399] =  {carol=0.2}, -- nibiru harp
    [21400] =  {all_songs=0.1,lullaby=0.2}, -- blurred harp
    [21401] =  {all_songs=0.2,ballad=0.2,lullaby=0.2}, -- blurred harp +1
    [21402] =  {lullaby=0.2}, -- damani horn
    [21403] =  {lullaby=0.3}, -- damani horn +1
    [21404] =  {all_songs=0.1}, -- Linos
    [21405] =  {all_songs=0.2}, -- eminent flute
    [21406] =  {reives_all_songs=0.2,reives_song_duration=0.2}, -- homestead flute; note this has a combined duration of +40% during reives
    [21409] =  {reives_all_songs=0.2}, -- forefront flute
    [22249] =  {all_songs=0.3}, -- Miracle Cheer
    [23183] =  {lullaby=0.1}, -- brioso cuffs +2
    [23518] =  {lullaby=0.2}, -- brioso cuffs +3
    [25901] =  {minne=0.1}, -- Mousai seraweels
    [25902] =  {minne=0.2}, -- Mousai seraweels +1
    [25968] =  {mambo=0.1}, -- Mousai crackows
    [25969] =  {mambo=0.2}, -- Mousai crackows +1
    [25988] =  {carol=0.1}, -- Mousai gages
    [25989] =  {carol=0.2}, -- Mousai gages +1
    [26031] =  {all_songs=0.1}, -- brioso whistle
    [26032] =  {all_songs=0.2}, -- moonbow whistle
    [26033] =  {all_songs=0.3}, -- moonbow whistle +1
    [26255] =  {madrigal=0.1,prelude=0.1}, -- Intarabus's cape
    [26537] =  {threnody=0.1}, -- Mousai manteel
    [26538] =  {threnody=0.2}, -- Mousai manteel +1
    [26758] =  {madrigal=0.1}, -- fili calot
    [26759] =  {madrigal=0.1}, -- fili calot +1
    [26916] =  {minuet=0.1}, -- fili hongreline
    [26917] =  {minuet=0.1}, -- fili hongreline +1
    [27070] =  {march=0.1}, -- fili manchettes
    [27071] =  {march=0.1}, -- fili manchettes +1
    [27255] =  {ballad=0.1}, -- fili rhingrave
    [27256] =  {ballad=0.1}, -- fili rhingrave +1
    [27429] =  {scherzo=0.1}, -- fili cothurnes
    [27430] =  {scherzo=0.1}, -- fili cothurnes +1
    [27952] =  {lullaby=0.1}, -- brioso cuffs
    [27973] =  {lullaby=0.1}, -- brioso cuffs +1    

    -- Song Duration +%
    [11093] = {0.1}, -- aoidos' hongreline +2 
    [11193] = {0.05}, -- aoidos' hongreline +1 
    [11618] = {0.1}, -- aoidos' matinee 
    [18571] = {0.3}, -- Daurdabla 
    [18575] = {0.25}, -- Daurdabla 
    [18576] = {0.3}, -- Daurdabla 
    [18839] = {0.3}, -- Daurdabla, Afterglow
    [19000] = {0.1}, -- Carnwenhan 
    [19069] = {0.2}, -- Carnwenhan 
    [19089] = {0.3}, -- Carnwenhan 
    [19621] = {0.4}, -- Carnwenhan 
    [19719] = {0.4}, -- Carnwenhan 
    [19828] = {0.5}, -- Carnwenhan--LV99 dagger
    [19957] = {0.5}, -- Carnwenhan-- 99 non-ilvl, Afterglow
    [20561] = {0.5}, -- Carnwenhan 
    [20562] = {0.5}, -- Carnwenhan 
    [20586] = {0.5}, -- Carnwenhan 
    [20599] = {0.05}, -- kali 
    [20629] = {0.05}, -- legato dagger 
    [21398] = {0.5}, -- Marsyas 
    [23317] = {0.13}, -- brioso slippers +2 
    [23652] = {0.15}, -- brioso slippers +3 
    [25865] = {0.12}, -- Inyanga shalwar 
    [25866] = {0.15}, -- Inyanga shalwar +1 
    [25882] = {0.17}, -- Inyanga shalwar +2 
    [26916] = {0.11}, -- fili hongreline 
    [26917] = {0.12}, -- fili hongreline +1 
    [28074] = {0.1}, -- Marduk's shalwar +1 
    [28232] = {0.1} -- brioso slippers 
}

composure_gear = S{
    11068, -- estoqueur's chappel +2
    11088, -- estoqueur's sayon +2
    11108, -- estoqueur's gantherots +2
    11128, -- estoqueur's fuseau +2
    11148, -- estoqueur's houseaux +2
    26748, -- lethargy chappel
    26749, -- lethargy chappel +1
    26906, -- lethargy sayon
    26907, -- lethargy sayon +1
    27060, -- lethargy gantherots
    27061, -- lethargy gantherots +1
    27245, -- lethargy fuseau
    27246, -- lethargy fuseau +1
    27419, -- lethargy houseaux
    27420, -- lethargy houseaux +1
}

enfeebling_relic_bonus = S{
    10654, -- duelist's chapeau +2
    23067, -- vitiation chapeau +2
    23402, -- vitiation chapeau +3
    26632, -- vitiation chapeau
    26633, -- vitiation chapeau +1
}

enhancing_relic_bonus = S{
    10694, -- duelist's gloves +2
    23201, -- vitiation gloves +2
    23536, -- vitiation gloves +3
    26984, -- vitiation gloves
    26985, -- vitiation gloves +1
}