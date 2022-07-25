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
    [20678] = { ['"Berserk" duration']={ -- Firangi
        value=15}},
    [10730] = { ['"Berserk" duration']={ -- warrior's calligae +2
        value=10}},
    [26246] = { ['"Berserk" duration']={ -- Cichol's mantle
        value=15}},
    [27807] = { ['"Berserk" duration']={ -- pummeler's lorica
        value=10}},
    [27828] = { ['"Berserk" duration']={ -- pummeler's lorica +1
        value=14}},
    [27328] = { ['"Berserk" duration']={ -- agoge calligae
        value=15}},
    [23107] = { ['"Berserk" duration']={ -- pummeler's lorica +2
        value=16}},
    [23666] = { ['"Berserk" duration']={ -- agoge calligae +3
        value=30}},
    [23442] = { ['"Berserk" duration']={ -- pummeler's lorica +3
        value=18}},
    [23331] = { ['"Berserk" duration']={ -- agoge calligae +2
        value=25}},
    [21764] = { ['"Berserk" duration']={ -- drastic axe; special case in that it adds to current duration
        value=1,
        condition='skillchain_performed'}},
    [20845] = { ['"Berserk" duration']={ -- instigator
        value=20},
                ['"Aggressor" duration']={
        value=20}},
    [20842] = { ['"Berserk" duration']={ -- Reikiono
        value=15}},
    [27329] = { ['"Berserk" duration']={ -- agoge calligae +1
        value=20}},
    [15245] = { ['"Warcry" duration']={ -- warrior's mask +1
        value=10}},
    [15072] = { ['"Warcry" duration']={ -- warrior's mask
        value=10}},
    [26624] = { ['"Warcry" duration']={ -- agoge mask
        value=25}},
    [23398] = { ['"Warcry" duration']={ -- agoge mask +3
        value=30}},
    [23063] = { ['"Warcry" duration']={ -- agoge mask +2
        value=30}},
    [10650] = { ['"Warcry" duration']={ -- warrior's mask +2
        value=20}},
    [26625] = { ['"Warcry" duration']={ -- agoge mask +1
        value=30}},
    [23532] = { ['"Defender" duration']={ -- agoge mufflers +3
        value=15}},
    [23197] = { ['"Defender" duration']={ -- agoge mufflers +2
        value=10}},
    [23040] = { ['"Aggressor" duration']={ -- pummeler's mask +2
        value=16}},
    [10670] = { ['"Aggressor" duration']={ -- warrior's lorica +2
        value=10}},
    [26801] = { ['"Aggressor" duration']={ -- agoge lorica +1
        value=20}},
    [26800] = { ['"Aggressor" duration']={ -- agoge lorica
        value=15}},
    [23130] = { ['"Aggressor" duration']={ -- agoge lorica +2
        value=25}},
    [23465] = { ['"Aggressor" duration']={ -- agoge lorica +3
        value=30}},
    [23375] = { ['"Aggressor" duration']={ -- pummeler's mask +3
        value=18}},
    [27663] = { ['"Aggressor" duration']={ -- pummeler's mask
        value=10}},
    [27684] = { ['"Aggressor" duration']={ -- pummeler's mask +1
        value=14}},
    [28249] = { ['"Flee" duration']={ -- pillager's poulaines +1
        value=16}},
    [28228] = { ['"Flee" duration']={ -- pillager's poulaines
        value=15}},
    [23313] = { ['"Flee" duration']={ -- pillager's poulaines +2
        value=17}},
    [23648] = { ['"Flee" duration']={ -- pillager's poulaines +3
        value=18}},
    [15358] = { ['"Holy Circle" duration']={ -- gallant leggings +1
        value=0.5,
        percent=true}},
    [28229] = { ['"Holy Circle" duration']={ -- reverence leggings
        value=0.5,
        percent=true}},
    [23314] = { ['"Holy Circle" duration']={ -- reverence leggings +2
        value=0.5,
        percent=true}},
    [28250] = { ['"Holy Circle" duration']={ -- reverence leggings +1
        value=0.5,
        percent=true}},
    [23649] = { ['"Holy Circle" duration']={ -- reverence leggings +3
        value=0.5,
        percent=true}},
    [14095] = { ['"Holy Circle" duration']={ -- gallant leggings
        value=0.5,
        percent=true}},
    [21641] = { ['"Cover" duration']={ -- Save the Queen III
        value=30}},
    [28251] = { ['"Arcane Circle" duration']={ -- ignominy sollerets +1
        value=0.5,
        percent=true}},
    [28230] = { ['"Arcane Circle" duration']={ -- ignominy sollerets
        value=0.5,
        percent=true}},
    [23315] = { ['"Arcane Circle" duration']={ -- ignominy sollerets +2
        value=0.5,
        percent=true}},
    [23650] = { ['"Arcane Circle" duration']={ -- ignominy sollerets +3
        value=0.5,
        percent=true}},
    [14096] = { ['"Arcane Circle" duration']={ -- chaos sollerets
        value=0.5,
        percent=true}},
    [15359] = { ['"Arcane Circle" duration']={ -- chaos sollerets +1
        value=0.5,
        percent=true}},
    [26253] = { ['"Last Resort" duration']={ -- Ankou's mantle; Special case for Absorbs
        value=15},
                ['"Absorb" duration']={
        value=10,
        percent=true}},
    [13971] = { ['"Shadowbind" duration']={ -- hunter's bracers
        value=10}},
    [23184] = { ['"Shadowbind" duration']={ -- orion bracers +2
        value=14}},
    [27974] = { ['"Shadowbind" duration']={ -- orion bracers +1
        value=12}},
    [23519] = { ['"Shadowbind" duration']={ -- orion bracers +3
        value=16}},
    [14900] = { ['"Shadowbind" duration']={ -- hunter's bracers +1
        value=10}},
    [27953] = { ['"Shadowbind" duration']={ -- orion bracers
        value=10}},
    [13868] = { ['"Warding Circle" duration']={ -- myochin kabuto
        value=0.5,
        percent=true},
                ['"Meditate" duration']={
        value=4}},
    [15236] = { ['"Warding Circle" duration']={ -- myochin kabuto +1
        value=0.5,
        percent=true},
                ['"Meditate" duration']={
        value=4}},
    [23051] = { ['"Warding Circle" duration']={ -- wakido kabuto +2
        value=0.5,
        percent=true},
                ['"Meditate" duration']={
        value=4}},
    [27674] = { ['"Warding Circle" duration']={ -- wakido kabuto
        value=0.5,
        percent=true},
                ['"Meditate" duration']={
        value=4}},
    [23386] = { ['"Warding Circle" duration']={ -- wakido kabuto +3
        value=0.5,
        percent=true},
                ['"Meditate" duration']={
        value=8}},
    [27695] = { ['"Warding Circle" duration']={ -- wakido kabuto +1
        value=0.5,
        percent=true},
                ['"Meditate" duration']={
        value=4}},
    [10701] = { ['"Meditate" duration']={ -- saotome kote +2
        value=8}},
    [14920] = { ['"Meditate" duration']={ -- saotome kote +1
        value=4}},
    [15113] = { ['"Meditate" duration']={ -- saotome kote
        value=4}},
    [21979] = { ['"Meditate" duration']={ -- Gekkei
        value=4}},
    [23208] = { ['"Meditate" duration']={ -- sakonji kote +2
        value=8}},
    [23543] = { ['"Meditate" duration']={ -- sakonji kote +3
        value=12}},
    [26257] = { ['"Meditate" duration']={ -- Smertrios's mantle
        value=8}},
    [26998] = { ['"Meditate" duration']={ -- sakonji kote
        value=8}},
    [26999] = { ['"Meditate" duration']={ -- sakonji kote +1
        value=8}},
    [23254] = { ['"Ancient Circle" duration']={ -- vishap brais +2
        value=0.5,
        percent=true}},
    [23589] = { ['"Ancient Circle" duration']={ -- vishap brais +3
        value=0.5,
        percent=true}},
    [28103] = { ['"Ancient Circle" duration']={ -- vishap brais
        value=0.5,
        percent=true}},
    [28124] = { ['"Ancient Circle" duration']={ -- vishap brais +1
        value=0.5,
        percent=true}},
    [14227] = { ['"Ancient Circle" duration']={ -- drachen brais
        value=0.5,
        percent=true}},
    [15574] = { ['"Ancient Circle" duration']={ -- drachen brais +1
        value=0.5,
        percent=true}},
    [23046] = { ['"Cover" duration']={ -- reverence coronet +2
        value=9}},
    [27690] = { ['"Cover" duration']={ -- reverence coronet +1
        value=9}},
    [27669] = { ['"Cover" duration']={ -- reverence coronet
        value=7}},
    [23381] = { ['"Cover" duration']={ -- reverence coronet +3
        value=10}},
    [20728] = { ['"Cover" duration']={ -- kheshig blade
        value=8}},
    [16604] = { ['"Cover" duration']={ -- Save the Queen
        value=5}},
    [12515] = { ['"Cover" duration']={ -- gallant coronet
        value=5}},
    [15231] = { ['"Cover" duration']={ -- gallant coronet +1
        value=5}},
    [15251] = { ['"Rampart" duration']={ -- valor coronet +1
        value=15}},
    [10656] = { ['"Rampart" duration']={ -- valor coronet +2
        value=30}},
    [23069] = { ['"Rampart" duration']={ -- caballarius coronet +2
        value=30}},
    [26637] = { ['"Rampart" duration']={ -- caballarius coronet +1
        value=30}},
    [15078] = { ['"Rampart" duration']={ -- valor coronet
        value=15}},
    [23404] = { ['"Rampart" duration']={ -- caballarius coronet +3
        value=30}},
    [26636] = { ['"Rampart" duration']={ -- caballarius coronet
        value=30}},
    [11084] = { ['"Blood Rage" duration']={ -- ravager's lorica +2
        value=30}},
    [26899] = { ['"Blood Rage" duration']={ -- boii lorica +1
        value=34}},
    [26898] = { ['"Blood Rage" duration']={ -- boii lorica
        value=32}},
    [11184] = { ['"Blood Rage" duration']={ -- ravager's lorica +1
        value=15}},
    [11120] = { ['"Phantom Roll" duration']={ -- navarch's gants +2
        value=40}},
    [11220] = { ['"Phantom Roll" duration']={ -- navarch's gants +1
        value=20}},
    [21482] = { ['"Phantom Roll" duration']={ -- compensator
        value=20}},
    [26038] = { ['"Phantom Roll" duration']={ -- regal necklace
        value=20}},
    [26262] = { ['"Phantom Roll" duration']={ -- Camulus's mantle
        value=30}},
    [27084] = { ['"Phantom Roll" duration']={ -- chasseur's gants
        value=45}},
    [27085] = { ['"Phantom Roll" duration']={ -- chasseur's gants +1
        value=50}}
}

dnc_modifiers = {
	[10728] = {  -- etoile tights +2
	    ['"Jig" duration'] = {
	    value=35,
	    percent=true}},
	[11393] = {  -- dancer's toe shoes +1
	    ['"Jig" duration'] = {
	    value=25,
	    percent=true}},
	[11394] = {  -- dancer's toe shoes +1
	    ['"Jig" duration'] = {
	    value=25,
	    percent=true}},
	[15746] = {  -- dancer's toe shoes
	    ['"Jig" duration'] = {
	    value=25,
	    percent=true}},
	[15747] = {  -- dancer's toe shoes
	    ['"Jig" duration'] = {
	    value=25,
	    percent=true}},
	[16360] = {  -- etoile tights
	    ['"Jig" duration'] = {
	    value=25,
	    percent=true}},
	[16361] = {  -- etoile tights +1
	    ['"Jig" duration'] = {
	    value=25,
	    percent=true}},
	[23282] = {  -- horos tights +2
	    ['"Jig" duration'] = {
	    value=50,
	    percent=true}},
	[23326] = {  -- maxixi toe shoes +2
	    ['"Jig" duration'] = {
	    value=45,
	    percent=true}},
	[23327] = {  -- maxixi toe shoes +2
	    ['"Jig" duration'] = {
	    value=45,
	    percent=true}},
	[23617] = {  -- horos tights +3
	    ['"Jig" duration'] = {
	    value=50,
	    percent=true}},
	[23661] = {  -- maxixi toe shoes +3
	    ['"Jig" duration'] = {
	    value=50,
	    percent=true}},
	[23662] = {  -- maxixi toe shoes +3
	    ['"Jig" duration'] = {
	    value=50,
	    percent=true}},
	[27188] = {  -- horos tights
	    ['"Jig" duration'] = {
	    value=40,
	    percent=true}},
	[27189] = {  -- horos tights +1
	    ['"Jig" duration'] = {
	    value=45,
	    percent=true}},
	[28241] = {  -- maxixi toe shoes
	    ['"Jig" duration'] = {
	    value=35,
	    percent=true}},
	[28242] = {  -- maxixi toe shoes
	    ['"Jig" duration'] = {
	    value=35,
	    percent=true}},
	[28262] = {  -- maxixi toe shoes +1
	    ['"Jig" duration'] = {
	    value=40,
	    percent=true}},
	[28263] = {  -- maxixi toe shoes +1
	    ['"Jig" duration'] = {
	    value=40,
	    percent=true}},
	[11475] = {  -- dancer's tiara +1
	    ['"Samba" duration'] = {
	    value=30}},
	[11476] = {  -- dancer's tiara +1
	    ['"Samba" duration'] = {
	    value=30}},
	[16138] = {  -- dancer's tiara
	    ['"Samba" duration'] = {
	    value=30}},
	[16139] = {  -- dancer's tiara
	    ['"Samba" duration'] = {
	    value=30}},
	[23058] = {  -- maxixi tiara +2
	    ['"Samba" duration'] = {
	    value=45}},
	[23059] = {  -- maxixi tiara +2
	    ['"Samba" duration'] = {
	    value=45}},
	[23393] = {  -- maxixi tiara +3
	    ['"Samba" duration'] = {
	    value=45}},
	[23394] = {  -- maxixi tiara +3
	    ['"Samba" duration'] = {
	    value=45}},
	[26264] = {  -- Senuna's mantle
	    ['"Samba" duration'] = {
	    value=15}},
	[27681] = {  -- maxixi tiara
	    ['"Samba" duration'] = {
	    value=40}},
	[27682] = {  -- maxixi tiara
	    ['"Samba" duration'] = {
	    value=40}},
	[27702] = {  -- maxixi tiara +1
	    ['"Samba" duration'] = {
	    value=45}},
	[27703] = {  -- maxixi tiara +1
	    ['"Samba" duration'] = {
	    value=45}}
}

run_modifiers = {
	[21698] = { ['"Liement" duration']={  -- bidenhander
	    value=3}},
	[23129] = { ['"Valiance" duration']={  -- runeist's coat +2
        value=17},
        ['"Vallation" duration']={  
	    value=17}},
	[23151] = { ['"Liement" duration']={  -- futhark coat +2
	    value=4}},
	[23196] = { ['"Gambit" duration']={  -- runeist's mitons +2
	    value=14}},
	[23464] = { ['"Valiance" duration']={  -- runeist coat +3
        value=19},
        ['"Vallation" duration']={ 
	    value=19}},
	[23486] = { ['"Liement" duration']={  -- futhark coat +3
	    value=5}},
	[23531] = { ['"Gambit" duration']={  -- runeist's mitons +3
	    value=16}},
	[26267] = { ['"Valiance" duration']={  -- Ogma's cape
        value=15},
        ['"Vallation" duration']={
	    value=15}},
	[26842] = { ['"Liement" duration']={  -- futhark coat
	    value=2}},
	[26843] = { ['"Liement" duration']={  -- futhark coat +1
	    value=3}},
	[27850] = { ['"Valiance" duration']={  -- runeist coat +1
        value=15},
        ['"Vallation" duration']={ 
	    value=15}},
	[27986] = { ['"Gambit" duration']={  -- runeist mitons +1
	    value=12}},
	[28067] = { ['"Gambit" duration']={  -- runeist mitons
	    value=10}}
}

-- Summoner; not needed due to how summoning skill is retrieved, but leaving in for now
smn_modifiers = {
    [10368] = { ['Summoning magic skill']={  -- adhara crackows
        value=8}},
    [10602] = { ['Summoning magic skill']={  -- rubeus boots
        value=10}},
    [10704] = { ['Summoning magic skill']={  -- summoner's bracers +2
        value=15}},
    [10823] = { ['Summoning magic skill']={  -- cimmerian sash
        value=5}},
    [11078] = { ['Summoning magic skill']={  -- caller's horn +2
        value=9}},
    [11098] = { ['Summoning magic skill']={  -- caller's doublet +2
        value=10}},
    [11138] = { ['Summoning magic skill']={  -- caller's spats +2
        value=6}},
    [11178] = { ['Summoning magic skill']={  -- caller's horn +1
        value=6}},
    [11198] = { ['Summoning magic skill']={  -- caller's doublet +1
        value=7}},
    [11619] = { ['Summoning magic skill']={  -- caller's pendant
        value=9}},
    [11675] = { ['Summoning magic skill']={  -- fervor ring
        value=4}},
    [11852] = { ['Summoning magic skill']={  -- hyksos robe
        value=10}},
    [11856] = { ['Summoning magic skill']={  -- anhur robe
        value=12}},
    [11860] = { ['Summoning magic skill']={  -- hyksos robe +1
        value=11}},
    [11982] = { ['Summoning magic skill']={  -- magavan slops
        value=6}},
    [11986] = { ['Summoning magic skill']={  -- mystagog slacks
        value=8}},
    [11987] = { ['Summoning magic skill']={  -- ngen seraweels
        value=10}},
    [12022] = { ['Summoning magic skill']={  -- caller's horn
        value=3}},
    [12042] = { ['Summoning magic skill']={  -- caller's doublet
        value=3}},
    [12520] = { ['Summoning magic skill']={  -- evoker's horn
        value=5}},
    [13158] = { ['Summoning magic skill']={  -- summoning torque
        value=7}},
    [13673] = { ['Summoning magic skill']={  -- magician's mantle
        value=5,
        condition='Subjob=SMN'}},
    [13939] = { ['Summoning magic skill']={  -- austere hat
        value=2}},
    [13940] = { ['Summoning magic skill']={  -- penance hat
        value=3}},
    [13950] = { ['Summoning magic skill']={  -- elite beret
        value=4}},
    [13951] = { ['Summoning magic skill']={  -- elite beret +1
        value=5}},
    [14189] = { ['Summoning magic skill']={  -- austere sabots
        value=3}},
    [14190] = { ['Summoning magic skill']={  -- penance sabots
        value=4}},
    [14310] = { ['Summoning magic skill']={  -- austere slops
        value=3}},
    [14311] = { ['Summoning magic skill']={  -- penance slops
        value=4}},
    [14365] = { ['Summoning magic skill']={  -- augur's jaseran
        value=10}},
    [14625] = { ['Summoning magic skill']={  -- evoker's ring
        value=10}},
    [14777] = { ['Summoning magic skill']={  -- summoning earring
        value=3}},
    [14826] = { ['Summoning magic skill']={  -- austere cuffs
        value=2}},
    [14827] = { ['Summoning magic skill']={  -- penance cuffs
        value=3}},
    [14923] = { ['Summoning magic skill']={  -- summoner's bracers +1
        value=12}},
    [15054] = { ['Summoning magic skill']={  -- beacon cuffs
        value=5}},
    [15116] = { ['Summoning magic skill']={  -- summoner's bracers
        value=10}},
    [15239] = { ['Summoning magic skill']={  -- evoker's horn +1
        value=5}},
    [15473] = { ['Summoning magic skill']={  -- astute cape
        value=5}},
    [15536] = { ['Summoning magic skill']={  -- rho necklace
        value=3,
        condition='Salvage:'}},
    [15637] = { ['Summoning magic skill']={  -- Marduk's shalwar
        value=5}},
    [15662] = { ['Summoning magic skill']={  -- nashira crackows
        value=5}},
    [15723] = { ['Summoning magic skill']={  -- Marduk's crackows
        value=5}},
    [15942] = { ['Summoning magic skill']={  -- summoning belt
        value=2}},
    [16096] = { ['Summoning magic skill']={  -- Marduk's tiara
        value=7}},
    [16342] = { ['Summoning magic skill']={  -- oracle's braconi
        value=5}},
    [17105] = { ['Summoning magic skill']={  -- soulscourge
        value=7}},
    [17598] = { ['Summoning magic skill']={  -- Bahamut's staff
        value=5}},
    [19058] = { ['Summoning magic skill']={  -- vox grip
        value=3}},
    [21120] = { ['Summoning magic skill']={  -- patriarch cane
        value=5}},
    [21145] = { ['Summoning magic skill']={  -- exemplar
        value=15}},
    [21178] = { ['Summoning magic skill']={  -- Tumafyrig
        value=7}},
    [23054] = { ['Summoning magic skill']={  -- convoker's horn +2
        value=17}},
    [23211] = { ['Summoning magic skill']={  -- glyphic bracers +2
        value=21}},
    [23389] = { ['Summoning magic skill']={  -- convoker's horn +3
        value=19}},
    [23546] = { ['Summoning magic skill']={  -- glyphic bracers +3
        value=23}},
    [25565] = { ['Summoning magic skill']={  -- Baayami hat
        value=26}},
    [25566] = { ['Summoning magic skill']={  -- Baayami hat +1
        value=31}},
    [25905] = { ['Summoning magic skill']={  -- Baayami slops
        value=30}},
    [25906] = { ['Summoning magic skill']={  -- Baayami slops +1
        value=35}},
    [25972] = { ['Summoning magic skill']={  -- Baayami sabots
        value=24}},
    [25973] = { ['Summoning magic skill']={  -- Baayami sabots +1
        value=29}},
    [25992] = { ['Summoning magic skill']={  -- Baayami cuffs
        value=28}},
    [25993] = { ['Summoning magic skill']={  -- Baayami cuffs +1
        value=33}},
    [26012] = { ['Summoning magic skill']={  -- melic torque
        value=10}},
    [26087] = { ['Summoning magic skill']={  -- Cath Palug earring
        value=5}},
    [26099] = { ['Summoning magic skill']={  -- Lodurr earring
        value=10}},
    [26320] = { ['Summoning magic skill']={  -- kobo obi
        value=8}},
    [26541] = { ['Summoning magic skill']={  -- Baayami robe
        value=32}},
    [26542] = { ['Summoning magic skill']={  -- Baayami robe +1
        value=37}},
    [26768] = { ['Summoning magic skill']={  -- beckoner's horn
        value=11}},
    [26769] = { ['Summoning magic skill']={  -- beckoner's horn +1
        value=13}},
    [26796] = { ['Summoning magic skill']={  -- psycloth tiara
        value=15}},
    [26926] = { ['Summoning magic skill']={  -- beckoner's doublet
        value=12}},
    [26927] = { ['Summoning magic skill']={  -- beckoner's doublet +1
        value=14}},
    [27004] = { ['Summoning magic skill']={  -- glyphic bracers
        value=17}},
    [27005] = { ['Summoning magic skill']={  -- glyphic bracers +1
        value=19}},
    [27108] = { ['Summoning magic skill']={  -- lamassu mitts
        value=21}},
    [27109] = { ['Summoning magic skill']={  -- lamassu mitts +1
        value=22}},
    [27265] = { ['Summoning magic skill']={  -- beckoner's spats
        value=15}},
    [27266] = { ['Summoning magic skill']={  -- beckoner's spats +1
        value=20}},
    [27651] = { ['Summoning magic skill']={  -- Marduk's tiara +1
        value=12}},
    [27677] = { ['Summoning magic skill']={  -- convoker's horn
        value=15}},
    [28074] = { ['Summoning magic skill']={  -- Marduk's shalwar +1
        value=11}},
    [28144] = { ['Summoning magic skill']={  -- Adapa's slacks +1
        value=14}},
    [28211] = { ['Summoning magic skill']={  -- Marduk's crackows +1
        value=11}},
    [28416] = { ['Summoning magic skill']={  -- lucidity sash
        value=7}},
    [28506] = { ['Summoning magic skill']={  -- andoaa earring
        value=5}},
    [28539] = { ['Summoning magic skill']={  -- globidonta ring
        value=5}},
    [28631] = { ['Summoning magic skill']={  -- conveyance cape
        value=8}}
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