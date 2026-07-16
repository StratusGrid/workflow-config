# signature = "pgp" pins plugin verification to the legacy PGP key instead of the default
# "auto", which prefers GitHub attestations. GitHub REST API 2026-03-10 dropped the `bundle`
# field from attestation list responses; tflint unmarshals the resulting null into a nil
# *bundle.Bundle without erroring and then panics dereferencing it during `tflint --init`.
# Upstream: https://github.com/terraform-linters/tflint/issues/2591
# Drop this line once that lands and the tflint we install carries the fix.
plugin "aws" {
    enabled   = true
    version   = "0.40.0"
    source    = "github.com/terraform-linters/tflint-ruleset-aws"
    signature = "pgp"
}
