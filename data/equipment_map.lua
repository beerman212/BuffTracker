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
    [23310] = {0.05}, -- Theophany Duckbills +2
    [23469] = {0.15}, -- Vitiation Tabard +3
    [23484] = {0.12}, -- Pedagogy Gown +3
    [23513] = {0.2}, -- Atrophy Gloves +3
    [23578] = {Regen=24}, -- Theophany Pantaloons +3
    [23620] = {0.3}, -- Futhark Trousers +3
    [23645] = {0.1}, -- Theophany Duckbills +3
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
    [26894] = {augment=0.09,Regen=12}, -- Telchine Chasuble
    [27048] = {augment=0.09}, -- Telchine Gloves
    [27056] = {Regen=21}, -- Ebers Mitts
    [27057] = {Regen=22}, -- Ebers Mitts +1
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
    [11073] = { ['Madrigal']={  -- aoidos' calot +2
                value=0.1}},
    [11093] = { ['Minuet']={  -- aoidos' hongreline +2
                value=0.1}},
    [11113] = { ['March']={  -- aoidos' manchettes +2
                value=0.1}},
    [11133] = { ['Ballad']={  -- aoidos' rhingrave +2
                value=0.1}},
    [11153] = { ['Scherzo']={  -- aoidos' cothurnes +2
                value=0.1}},
    [17344] = { ['Minuet']={  -- cornette
                value=0.1}},
    [17346] = { ['Requiem']={  -- siren flute
                value=0.2}},
    [17347] = { ['Threnody']={  -- piccolo
                value=0.1}},
    [17348] = { ['Madrigal']={  -- traversiere
                value=0.1}},
    [17349] = { ['March']={  -- faerie piccolo
                value=0.2}},
    [17350] = { ['Prelude']={  -- angel's flute
                value=0.1}},
    [17351] = { ['Mambo']={  -- gemshorn
                value=0.1}},
    [17352] = { ['Elegy']={  -- horn
                value=0.1}},
    [17354] = { ['Minne']={  -- harp
                value=0.1}},
    [17360] = { ['March']={  -- langeleik
                value=0.3},
                ['Etude']={
                value=0.3}},
    [17361] = { ['Carol']={  -- crumhorn
                value=0.1}},
    [17362] = { ['Requiem']={  -- shofar
                value=0.2}},
    [17363] = { ['Hymnus']={  -- mass chalemie
                value=0.3},
                ['Scherzo']={
                value=0.1}},
    [17366] = { ['Lullaby']={  -- Mary's horn
                value=0.1}},
    [17367] = { ['March']={  -- Royal Spearman's horn
                value=0.1}},
    [17368] = { ['Threnody']={  -- piccolo +1
                value=0.2}},
    [17369] = { ['Minuet']={  -- cornette +1
                value=0.2}},
    [17370] = { ['Mambo']={  -- gemshorn +1
                value=0.2}},
    [17371] = { ['Elegy']={  -- horn +1
                value=0.2}},
    [17372] = { ['Requiem']={  -- flute +1
                value=0.1}},
    [17373] = { ['Minne']={  -- maple harp +1
                value=0.1}},
    [17374] = { ['Minne']={  -- harp +1
                value=0.2}},
    [17375] = { ['Madrigal']={  -- traversiere +1
                value=0.2}},
    [17377] = { ['Carol']={  -- crumhorn +1
                value=0.2}},
    [17378] = { ['Prelude']={  -- angel's flute +1
                value=0.2}},
    [17379] = { ['Requiem']={  -- Hamelin flute
                value=0.2}},
    [17832] = { ['Requiem']={  -- shofar +1
                value=0.3}},
    [17835] = { ['March']={  -- San d'Orian horn
                value=0.1}},
    [17836] = { ['March']={  -- Kingdom horn
                value=0.1}},
    [17838] = { ['Mazurka']={  -- harlequin's horn
                value=0.2}},
    [17839] = { ['Finale']={  -- military harp
                value=0.2}},
    [17840] = { ['Hymnus']={  -- angel lyre
                value=0.2}},
    [17841] = { ['Lullaby']={  -- nursemaid's harp
                value=0.2}},
    [17842] = { ['Threnody']={  -- sorrowful harp
                value=0.3}},
    [17844] = { ['Requiem']={  -- flute +2
                value=0.1}},
    [17845] = { ['Madrigal']={  -- traversiere +2
                value=0.2}},
    [17846] = { ['Minuet']={  -- cornette +2
                value=0.2}},
    [17847] = { ['Carol']={  -- crumhorn +2
                value=0.2}},
    [17849] = { ['Mambo']={  -- hellish bugle
                value=0.1}},
    [17850] = { ['Mambo']={  -- hellish bugle +1
                value=0.2}},
    [17851] = { ['Ballad']={  -- storm fife
                value=0.1,
                condition='Assault:'}},
    [17852] = { ['Requiem']={  -- Requiem flute
                value=0.4}},
    [17853] = { ['March']={  -- Iron Ram horn
                value=0.2}},
    [17854] = { ['Lullaby']={  -- cradle horn
                value=0.2}},
    [17855] = { ['Finale']={  -- ney
                value=0.2}},
    [17856] = { ['Elegy']={  -- syrinx
                value=0.3},
                ['Minne']={
                value=0.3}},
    [18341] = { ['All Songs']={  -- millennium horn
                value=0.2,
                {condition='In Dynamis:'}}},
    [18342] = { ['All Songs']={  -- Gjallarhorn
                value=0.2}},
    [18343] = { ['Finale']={  -- Pan's horn
                value=0.3},
                ['Lullaby']={
                value=0.3}},
    [18572] = { ['All Songs']={  -- Gjallarhorn
                value=0.4}},
    [18577] = { ['All Songs']={  -- Gjallarhorn
                value=0.2}},
    [18578] = { ['All Songs']={  -- Gjallarhorn
                value=0.2}},
    [18579] = { ['All Songs']={  -- Gjallarhorn
                value=0.3}},
    [18580] = { ['All Songs']={  -- Gjallarhorn
                value=0.3}},
    [18831] = { ['Ballad']={  -- crooner's cithara
                value=0.1}},
    [18832] = { ['Minuet']={  -- apollo's flute
                value=0.3}},
    [18833] = { ['Madrigal']={  -- cantabank's horn
                value=0.3},
                ['Prelude']={
                value=0.3}},
    [18834] = { ['Mambo']={  -- vihuela
                value=0.3},
                ['Mazurka']={
                value=0.3}},
    [18840] = { ['All Songs']={  -- Gjallarhorn
                value=0.4}},
    [21399] = { ['Carol']={  -- nibiru harp
                value=0.2}},
    [21400] = { ['All Songs']={  -- blurred harp
                value=0.1},
                ['Lullaby']={
                value=0.2}},
    [21401] = { ['All Songs']={  -- blurred harp +1
                value=0.2},
                ['Ballad']={
                value=0.2},
                ['Hymnus']={
                value=0.2}},
    [21402] = { ['Lullaby']={  -- damani horn
                value=0.2}},
    [21403] = { ['Lullaby']={  -- damani horn +1
                value=0.3}},
    [21404] = { ['All Songs']={  -- Linos
                value=0.1}},
    [21405] = { ['All Songs']={  -- eminent flute
                value=0.2}},
    [21406] = { ['All Songs']={  -- homestead flute; note this has a combined duration of +40% during Reives
                value=0.2,
                condition='Reives:'},
                ['Increases song effect duration']={
                value=0.2,
                condition='Reives:'}},
    [21409] = { ['All Songs']={  -- forefront flute
                value=0.2,
                condition='Reives:'}},
    [22249] = { ['All Songs']={  -- Miracle Cheer
                value=0.3}},
    [23183] = { ['Lullaby']={  -- brioso cuffs +2
                value=0.1}},
    [23518] = { ['Lullaby']={  -- brioso cuffs +3
                value=0.2}},
    [25901] = { ['Minne']={  -- Mousai seraweels
                value=0.1}},
    [25902] = { ['Minne']={  -- Mousai seraweels +1
                value=0.2}},
    [25968] = { ['Mambo']={  -- Mousai crackows
                value=0.1}},
    [25969] = { ['Mambo']={  -- Mousai crackows +1
                value=0.2}},
    [25988] = { ['Carol']={  -- Mousai gages
                value=0.1}},
    [25989] = { ['Carol']={  -- Mousai gages +1
                value=0.2}},
    [26031] = { ['All Songs']={  -- brioso whistle
                value=0.1}},
    [26032] = { ['All Songs']={  -- moonbow whistle
                value=0.2}},
    [26033] = { ['All Songs']={  -- moonbow whistle +1
                value=0.3}},
    [26255] = { ['Madrigal']={  -- Intarabus's cape
                value=0.1},
                ['Prelude']={
                value=0.1}},
    [26537] = { ['Threnody']={  -- Mousai manteel
                value=0.1}},
    [26538] = { ['Threnody']={  -- Mousai manteel +1
                value=0.2}},
    [26758] = { ['Madrigal']={  -- fili calot
                value=0.1}},
    [26759] = { ['Madrigal']={  -- fili calot +1
                value=0.1}},
    [26916] = { ['Minuet']={  -- fili hongreline
                value=0.1}},
    [26917] = { ['Minuet']={  -- fili hongreline +1
                value=0.1}},
    [27070] = { ['March']={  -- fili manchettes
                value=0.1}},
    [27071] = { ['March']={  -- fili manchettes +1
                value=0.1}},
    [27255] = { ['Ballad']={  -- fili rhingrave
                value=0.1}},
    [27256] = { ['Ballad']={  -- fili rhingrave +1
                value=0.1}},
    [27429] = { ['Scherzo']={  -- fili cothurnes
                value=0.1}},
    [27430] = { ['Scherzo']={  -- fili cothurnes +1
                value=0.1}},
    [27952] = { ['Lullaby']={  -- brioso cuffs
                value=0.1}},
    [27973] = { ['Lullaby']={  -- brioso cuffs +1    
                value=0.1}},

    -- Song Duration +%
    [11093] = { ['Increases song effect duration']={  -- aoidos' hongreline +2 
                value=0.1}},
    [11193] = { ['Increases song effect duration']={  -- aoidos' hongreline +1 
                value=0.05}},
    [11618] = { ['Increases song effect duration']={  -- aoidos' matinee 
                value=0.1}},
    [18571] = { ['Increases song effect duration']={  -- Daurdabla 
                value=0.3}},
    [18575] = { ['Increases song effect duration']={  -- Daurdabla 
                value=0.25}},
    [18576] = { ['Increases song effect duration']={  -- Daurdabla 
                value=0.3}},
    [18839] = { ['Increases song effect duration']={  -- Daurdabla, Afterglow
                value=0.3}},
    [19000] = { ['Increases song effect duration']={  -- Carnwenhan 
                value=0.1}},
    [19069] = { ['Increases song effect duration']={  -- Carnwenhan 
                value=0.2}},
    [19089] = { ['Increases song effect duration']={  -- Carnwenhan 
                value=0.3}},
    [19621] = { ['Increases song effect duration']={  -- Carnwenhan 
                value=0.4}},
    [19719] = { ['Increases song effect duration']={  -- Carnwenhan 
                value=0.4}},
    [19828] = { ['Increases song effect duration']={  -- Carnwenhan--LV99 dagger
                value=0.5}},
    [19957] = { ['Increases song effect duration']={  -- Carnwenhan-- 99 non-ilvl, Afterglow
                value=0.5}},
    [20561] = { ['Increases song effect duration']={  -- Carnwenhan 
                value=0.5}},
    [20562] = { ['Increases song effect duration']={  -- Carnwenhan 
                value=0.5}},
    [20586] = { ['Increases song effect duration']={  -- Carnwenhan 
                value=0.5}},
    [20599] = { ['Increases song effect duration']={  -- kali 
                value=0.05}},
    [20629] = { ['Increases song effect duration']={  -- legato dagger 
                value=0.05}},
    [21398] = { ['Increases song effect duration']={  -- Marsyas 
                value=0.5}},
    [23317] = { ['Increases song effect duration']={  -- brioso slippers +2 
                value=0.13}},
    [23652] = { ['Increases song effect duration']={  -- brioso slippers +3 
                value=0.15}},
    [25865] = { ['Increases song effect duration']={  -- Inyanga shalwar 
                value=0.12}},
    [25866] = { ['Increases song effect duration']={  -- Inyanga shalwar +1 
                value=0.15}},
    [25882] = { ['Increases song effect duration']={  -- Inyanga shalwar +2 
                value=0.17}},
    [26916] = { ['Increases song effect duration']={  -- fili hongreline 
                value=0.11}},
    [26917] = { ['Increases song effect duration']={  -- fili hongreline +1 
                value=0.12}},
    [28074] = { ['Increases song effect duration']={  -- Marduk's shalwar +1 
                value=0.1}},
    [28232] = { ['Increases song effect duration']={  -- brioso slippers 
                value=0.1}}
}

ja_modifiers = {
    --Dragoon
    [14227] = { ['Enhances "Ancient Circle Effect"']={ -- drachen brais
        value=0.5}},
    [15574] = { ['Enhances "Ancient Circle Effect"']={ -- drachen brais +1 
    value=0.5}},
    [23254] = { ['Enhances "Ancient Circle Effect"']={ -- vishap brais +2
        value=0.5}},
    [23589] = { ['Enhances "Ancient Circle Effect"']={ -- vishap brais +3
        value=0.5}},
    [28103] = { ['Enhances "Ancient Circle Effect"']={ -- vishap brais
        value=0.5}},
    [28124] = { ['Enhances "Ancient Circle Effect"']={ -- vishap brais +1
        value=0.5}}
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