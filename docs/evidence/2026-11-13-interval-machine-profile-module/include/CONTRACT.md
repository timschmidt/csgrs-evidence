# Same-module include for typed fraction constructor

The child-module prototype fails the scalar size gate (+120 ELF bytes, +48 text,
+8 GOT, +24 relocation). Existing Rational::fraction changes a five-byte direct
call to its reducer into a six-byte indirect call; more existing functions grow.
This is reproduced on the current source and retained in the parent record.

Use the existing arithmetic.rs include! organization for the new typed constructor
instead of introducing a child code-generation module. Keep every old construction
file byte unchanged and preserve its original diagnostic locations. New public
method, inline attribute, input facts and shared reducer are unchanged. Inherits
the parent domain/properties and all retention gates. This change addresses the
measured ownership/linkage boundary; it is not an exception to any size gate.
