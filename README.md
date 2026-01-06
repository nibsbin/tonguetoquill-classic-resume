# Tonguetoquill Classic Resume

[![github-repository](https://img.shields.io/badge/GitHub-Repository-blue?logo=github)](https://github.com/nibsbin/tonguetoquill-classic-resume)
[![typst-universe](https://img.shields.io/badge/Typst-Universe-aqua)](https://typst.app/universe/package/tonguetoquill-classic)
[![nibs](https://img.shields.io/badge/author-Nibs-white?logo=github)](https://github.com/nibsbin)

A clean and modern resume template for Typst.

Maintained by [tonguetoquill.com](https://www.tonguetoquill.com).

## Usage

### Local Development

1.  **Install Typst**: Follow instructions at [typst.app](https://typst.app).
2.  **Compile**: Run the build script.

    ```bash
    ./scripts/build.sh
    ```

### Using the Template

Import components from the package:

```typst
#import "@preview/tonguetoquill-classic:0.1.0": resume, header_block, section_header, entry_block, key_value_grid, simple_grid

#show: resume

// ... content ...
```
**(Note: Local imports should be used until published)**

## License

MIT
