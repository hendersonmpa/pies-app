################# Comments ############################

comment <- function(id, comment){
    div(h5(id),
        p(comment),
        hr())
}

comments <- function(){
    tabPanel("Comments",
             h3("Urine"),
             hr(),
             h4("Normal"),
             hr(),
             comment("POR49", "The pattern and concentration of haeme intermediates observed by chromatographic fractionation and fluorescence detection are not suggestive of a porphyria."),
             comment("POR6 - Concentrate urine sample", "Slight elevation in multiple haeme intermediates along with an elevated 24 hour urine creatinine concentration is consistent with highly concentrated urine sample. The pattern of haeme intermediates observed by chromatographic fractionation and fluorescence detection are not suggestive of a porphyria."),
             h4("Query Acute"),
             hr(),
             comment("POR7 - Query Acute Porphyri", "Elevated uroporphyrin I and III along with elevated coproporphyrin III is suggestive of abnormal porphyrin metabolism. If an acute porphyria (e.g. variegate porphyria or hereditary coproporphyria) is suspected clinically, collect a random urine for ALA and PBG, and a random stool sample for fecal porphyrins. Rule out secondary causes of coproporphyria (liver disease, heavy metal poisoning, various drugs, infections, etc.)."),
             comment("POR8 - Query VP, HCP", "Slight increase in urinary uroporphyrin III and coproporphyrin III. If an acute porphyria (e.g. variegate porphyria or hereditary coproporphyria) is suspected clinically, collect a random urine for ALA and PBG, and a random stool sample for fecal porphyrins. Rule out secondary causes of coproporphyria (liver disease, heavy metal poisoning, various drugs, infections, etc.)."),
             comment("POR9 - Isolated Uro I", "Isolated increase in uroporphyrin I relative to other haeme intermediates. The pattern of haeme intermediates is suggestive of an acute porphyria although haeme intermediates are present at low concentration, possibly due to a long interval between the onset of acute symptoms and sample collection. Interpret in light of clinical findings. A repeat urine sample for porphyrins and ALA and PBG is suggested."),
             comment("POR10 - Isolated CIII:Query VP, HCP", "Increased urinary coproporphyrin III with a coproporphyrin III/I ratio greater than 10 is suggestive of hereditary coproporphyria. If an acute porphyria (e.g. variegate porphyria or hereditary coproporphyria) is suspected clinically, collect a random urine for ALA and PBG, and a random stool sample for fecal porphyrins. Rule out secondary causes of coproporphyria (liver disease, heavy metal poisoning, various drugs, infections, etc.)."),
             comment("POR11  - Coproporphyrinuria", "Moderate increase in urinary coproporphyrins I and III relative to other haeme intermediates. If an acute porphyria (e.g. hereditary coproporphyria) is suspected clinically, collect a random urine for ALA and PBG, and a random stool sample for fecal porphyrins. Rule out secondary causes of coproporphyria (liver disease, heavy metal poisoning, various drugs, infections, etc.)."),
             h4("Slight Elevations"),
             hr(),
             comment("POR12 - Slight elevation in all fractions", "Slight elevation in multiple haeme intermediates. Interpret in light of clinical findings. The pattern may indicate porphyria cutanea tarda, or an acute porphyrin (e.g. AIP or VP). If an acute porphyria is suspected, collect a random urine sample for ALA and PBG during the acute attack, and a random stool sample for porphyrins. If PCT is suspected, collect a second 24 hour urine sample for confirmation."),
             comment("POR13 - Slight elevation in copro III or both I and III","The slight elevation in coproporphyrins observed in this sample is not suggestive of a porphyria. Secondary causes of elevated coproporphyrinuria are common: alcohol, liver dysfunction, various drugs, and infections."),
             h4("PCT"),
             hr(),
             comment("POR14 - PCT", "Elevation in uroporphyrins I & III with increased hepta, hexa and penta carboxyl porphyrin intermediates is consistent with porphyria cutanea tarda (PCT)."),
             comment("POR15 - Low conc: Query PCT", "While the concentration of haeme intermediates is within established reference intervals the pattern of intermediates present is suggestive of porphyria cutanea tarda (PCT). This may be due to resolution of an acute exacerbation. Please consider a repeat 24 hour urine sample and a fecal sample for porphyrin analysis to permit confirmation."),
             comment("POR16 - Elevation in all fractions: Query PCT", "Elevation in all porphyrin fractions. The pattern may indicate porphyria cutanea tarda (PCT). Interpret in light of clinical findings. If an acute porphyria is suspected, suggest a random urine sample for ALA and PBG, and a random stool sample for porphyrins."),
             comment("POR18 - Moderate Elevation in CI","Isolated moderate elevation in coproporphyrin I. A common cause of coproporphyrinuria is impaired biliary excretion of coproporphyrin I due to hepatobiliary disorders such as cholestatic jaundice, hepatitis and cirrhosis."),
             h4("Interference"),
             hr(),
             comment("POR19 - Interfering Peak", "Porphyrin quantitation by liquid chromatography with fluoresence detection revealed a large isolated peak with a retention time similar to hexacarboxyl porphyrin, other porphyrin intermediates are not elevated. An isolated increase in hexacarboxyl is not characteristic of a porphyria and this peak is likely due to the presence of a co-eluting fluorescent material (e.g. medication, vitamin, supplement) in the sample.  Please submit an additional 24 hour urine sample for analysis."),
             h3("Fecal"),
             hr(),
             comment("POR20 - Elevated protoporphyrin","Elevated protoporphyrin IX in feces is observed in varigate porphyria and erythropoetic protoporphyria. If and acute prophryia is suspected please submit a random urine sample collected during an acute attack for ALA/PBG quantitation. If a cutaneous porphyria is suspected please submit a whole blood sample for free erythrocyte protporphyrin quantiation."),
             comment("POR21 - Elevated protoporphyrin and FEP", "Elevated protoporphyrin IX in feces with free erythrocyte protoporphyrin >3 times the upper limit of normal is suggestive of erythrocytic protoporphyria (EPP). Clinical presentation of EPP includes cutaneous photosensitivity in sun-exposed areas of the skin and generally worsens in the spring and summer months. The onset of symptoms typically occurs in childhood. Common symptoms may include itching, edema, erythema, stinging or burning sensations, and occasionally scarring of the skin in sun-exposed areas."),
             comment("POR22 - Fecal PCT", "Fecal porphyrin pattern is suggestive of porphyria cutanea tarda (PCT), however, a urine sample is the preferred sample for screening and monitoring PCT. Please submit a 24 hour urine sample for analysis."),
             comment("POR23 - Stool Dicarboxylic Porphyrins", "Without evidence of clinical symptoms of an acute porphyria the observed porphyrin pattern is consistent with bacterial metabolism of haeme from the diet or a small gastrointestinal bleed. Even minor GI bleeding (i.e. FOBT negative) will increase dicarboxylic porphyrins (deutro, meso and proto).

If an acute porphyria is suspected (i.e. variegate porphyria) please submit a 24 hour urine sample for porphyrin quantitation and a random urine sample collected during an acute attack for ALA/PBG quantitation."),
comment("POR24 - Slight Increase porphyrin intermediates", "Fecal porphyrin quantitation shows slight increase in multiple porphyrin intermediates. This is a non-specific finding and may be due to bacterial metabolism of haeme from the diet."),
h4("Whole Blood"),
hr(),
comment("FEP - Elevated FEP", "Elevated fluorescence in the Soret peak indicates elevated free erythrocyte protoporphyrins (FEP). Measurement of free protoporphyrins includes protoporphyrin IX and zinc protoporphyrin. Zinc protoporphyrin is elevated in iron deficiency or lead poisoning. Protoporphyrin IX is elevated in erythrocytic protoporphyria. FEP>3 times the upper limit of normal (0.4-1.0 umol/L erythrocytes) is suggestive of erythrocytic protoporphyria.")

             )}
