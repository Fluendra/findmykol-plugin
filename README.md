# FindMyKOL for Claude

![FindMyKOL](assets/icon.png)

FindMyKOL finds the right medical experts for life-sciences work. This plugin connects Claude to the FindMyKOL directory: 220,000+ physician and researcher profiles for Medical Affairs, clinical and commercial teams in pharma and biotech.

Ask for experts by disease area, drug, company, specialty, institution, society role type such as guideline panel seats, US region or country. Filter to people who run clinical trials, hold NIH grants, report industry payments or present at congresses. Sort by citations, h-index, trial count or rising activity. Every answer links to the full profile on findmykol.com.

## Install

In Claude, add FindMyKOL from the plugin directory. In Claude Code you can also install it from this repository:

```
/plugin install findmykol --marketplace Fluendra/findmykol-plugin
```

## What the plugin contains

- **`find-kols` skill**: instructions that tell Claude when and how to use the directory tools.
- **FindMyKOL MCP server**: a remote server at `https://www.findmykol.com/api/mcp`. It has three read-only tools:
  - `search_kols` searches and ranks profiles.
  - `get_kol_profile` returns one profile with recent publications and activity metrics.
  - `get_facet_counts` lists valid filter values with result counts.

The plugin runs no local code, hooks or scripts.

## What it sends and where

Each tool call sends its arguments (the search text and filters, or a profile slug) to `www.findmykol.com` and nothing else. No sign-in is needed and the plugin asks for no credentials. The server keeps a call log (tool, arguments, timing, client user agent and IP) to measure use and to limit abuse. Links in results carry `utm_source=claude&utm_medium=mcp` so the site can count visits from Claude.

The data comes from public sources: PubMed and OpenAlex scholarly records, ClinicalTrials.gov, NIH RePORTER, CMS Open Payments and the NPPES registry. The directory holds no patient data and no protected health information.

## Links

- Website: https://www.findmykol.com
- Privacy policy: https://www.findmykol.com/privacy
- Terms: https://www.findmykol.com/terms
- Support: https://www.findmykol.com/contact or hello@findmykol.com

## License

MIT for the files in this repository. The directory data stays on the FindMyKOL service under its terms.
