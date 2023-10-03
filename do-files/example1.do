*=============================================================================
* Date:    April 2023
* 
* Project: Trade Policy and Exporters' Resilience: Evidence from Indonesia
*
* Description: Do NTMs prevent firms from taking advantage of the depreciated 
*              exchange rates from China, by restricting them from switching to 
*              Chinese imports. In this case, we would expect to see that if 
*              exchange rate depreciates, the imports of firms facing NTMs from 
*              China reduces relative to firms that do not face any NTMs. 
*              The reason is that NTM firms are not able to easily take advantage
*              of the depreciated currency to switch to cheaper Chinese inputs. 
*              We would expect to see c.logRER#c.wgtimpsyntm to be negative. 
*
*                 
* Inputs: 
* 
* Outputs: 
*         
* Stata version 
* version 17.0
*=============================================================================

* Clear environment 
clear all


* Define globals for directories
if "`c(username)'" == "WB602786" { // Simon 
	global root "C:\Users\WB602786\OneDrive - WBG\NTM Project"
} 
else if "`c(username)'" == "wb564418" { // Devaki
	global root "C:\Users\WB602786\OneDrive - WBG\NTM Project"
}

* Globals 
global data "$root\data" 
global outputs "$root\outputs"
global outputproducer "$outputs\tables\Intensive Margin - Producer"
