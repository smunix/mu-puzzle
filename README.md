# [mu-puzzle][]

A project to address the MU puzzle problem as described at
<https://en.wikipedia.org/wiki/MU_puzzle>.

Example :
λ> runIdentity . unMUT $ sequence . fmap (print) <$> derivations (from "IIIUIII") (from "")

Derivation {drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xI → xIU] => "IIIUIIIU","IIIUIIIU" => [xIIIy → xUy] => "UUIIIU","UUIIIU" => [xIIIy → xUy] => "UUUU","UUUU" => [xUUy  → xy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xI → xIU] => "IIIUIIIU","IIIUIIIU" => [xIIIy → xUy] => "UUIIIU","UUIIIU" => [xIIIy → xUy] => "UUUU","UUUU" => [xUUy  → xy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xI → xIU] => "IIIUIIIU","IIIUIIIU" => [xIIIy → xUy] => "UUIIIU","UUIIIU" => [xIIIy → xUy] => "UUUU","UUUU" => [xUUy  → xy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xI → xIU] => "IIIUIIIU","IIIUIIIU" => [xIIIy → xUy] => "UUIIIU","UUIIIU" => [xUUy  → xy] => "IIIU","IIIU" => [xIIIy → xUy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xI → xIU] => "IIIUIIIU","IIIUIIIU" => [xIIIy → xUy] => "IIIUUU","IIIUUU" => [xIIIy → xUy] => "UUUU","UUUU" => [xUUy  → xy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xI → xIU] => "IIIUIIIU","IIIUIIIU" => [xIIIy → xUy] => "IIIUUU","IIIUUU" => [xIIIy → xUy] => "UUUU","UUUU" => [xUUy  → xy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xI → xIU] => "IIIUIIIU","IIIUIIIU" => [xIIIy → xUy] => "IIIUUU","IIIUUU" => [xIIIy → xUy] => "UUUU","UUUU" => [xUUy  → xy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xI → xIU] => "IIIUIIIU","IIIUIIIU" => [xIIIy → xUy] => "IIIUUU","IIIUUU" => [xUUy  → xy] => "IIIU","IIIU" => [xIIIy → xUy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xI → xIU] => "IIIUIIIU","IIIUIIIU" => [xIIIy → xUy] => "IIIUUU","IIIUUU" => [xUUy  → xy] => "IIIU","IIIU" => [xIIIy → xUy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xIIIy → xUy] => "UUIII","UUIII" => [xI → xIU] => "UUIIIU","UUIIIU" => [xIIIy → xUy] => "UUUU","UUUU" => [xUUy  → xy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xIIIy → xUy] => "UUIII","UUIII" => [xI → xIU] => "UUIIIU","UUIIIU" => [xIIIy → xUy] => "UUUU","UUUU" => [xUUy  → xy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xIIIy → xUy] => "UUIII","UUIII" => [xI → xIU] => "UUIIIU","UUIIIU" => [xIIIy → xUy] => "UUUU","UUUU" => [xUUy  → xy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xIIIy → xUy] => "UUIII","UUIII" => [xI → xIU] => "UUIIIU","UUIIIU" => [xUUy  → xy] => "IIIU","IIIU" => [xIIIy → xUy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xIIIy → xUy] => "UUIII","UUIII" => [xUUy  → xy] => "III","III" => [xI → xIU] => "IIIU","IIIU" => [xIIIy → xUy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}
Derivation{drvStart = [I,I,I,U,I,I,I], drvSteps = ["IIIUIII" => [xIIIy → xUy] => "IIIUU","IIIUU" => [xUUy  → xy] => "III","III" => [xI → xIU] => "IIIU","IIIU" => [xIIIy → xUy] => "UU","UU" => [xUUy  → xy] => ""], drvDerived = []}

Start working on your project with the Stack commands
you know and love.

``` sh
# Build the project.
stack build

# Run the test suite.
stack test

# Run the benchmarks.
stack bench

# Generate documentation.
stack haddock
```

Thanks again, and happy hacking!

[mu-puzzle]: https://github.com/smunix/mu-puzzle
