# Tonguetoquill Classic Resume

A classic resume template for Typst, implementing the "Carnegie Classic" specification.

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
