// The test checks that GPU device/target definitions (including all synonyms) are successfully consumed by compiler.

// RUN: %{ispc} %s -o %t.o --nostdlib --target=gen9-x8 --device=skl
// RUN: %{ispc} %s -o %t.o --nostdlib --target=gen9-x8 --device=tgllp
// RUN: %{ispc} %s -o %t.o --nostdlib --target=gen9-x8 --device=dg1
// RUN: %{ispc} %s -o %t.o --nostdlib --target=gen9-x16 --device=skl
// RUN: %{ispc} %s -o %t.o --nostdlib --target=gen9-x16 --device=tgllp
// RUN: %{ispc} %s -o %t.o --nostdlib --target=gen9-x16 --device=dg1
// RUN: not %{ispc} %s -o %t.o --nostdlib --target=xelp-x8 --device=skl
// RUN: %{ispc} %s -o %t.o --nostdlib --target=xelp-x8 --device=tgllp
// RUN: %{ispc} %s -o %t.o --nostdlib --target=xelp-x8 --device=dg1
// RUN: not %{ispc} %s -o %t.o --nostdlib --target=xelp-x16 --device=skl
// RUN: %{ispc} %s -o %t.o --nostdlib --target=xelp-x16 --device=tgllp
// RUN: %{ispc} %s -o %t.o --nostdlib --target=xelp-x16 --device=dg1

// REQUIRES: XE_ENABLED

uniform int i;

task void foo() {}