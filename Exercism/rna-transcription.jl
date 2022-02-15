"""
Given a DNA strand, return its RNA complement (per RNA transcription).

    G -> C
    C -> G
    T -> A
    A -> U

    This solution takes advantage of multiple-dispatch, where different functions are called based on the input to the function

"""

function DNA_to_RNA_nucleotide_translation(nucleotide::Char)

  nucleotide == 'C' && return 'G'
  nucleotide == 'G' && return 'C'
  nucleotide == 'T' && return 'A'
  nucleotide == 'A' && return 'U'

  throw(ErrorException("Unknown nucleotide: $nucleotide"))

end

function to_rna(dna::AbstractString)

  map(DNA_to_RNA_nucleotide_translation, dna)

end


# function to_rna(dna::String)
#     DNA_components = ['A', 'C', 'G', 'T']
#     is_valid_DNA = [letter in DNA_components for letter in dna]
#
#     if !all(is_valid_DNA)
#         throw(ErrorException("DNA sequence can only contain A, C, G, T"))
#     end
#
#     rna = ""
#     for i in 1:length(dna)
#         if dna[i] == 'G'
#             rna *= 'C'
#         elseif dna[i] == 'C'
#             rna *= 'G'
#         elseif dna[i] == 'T'
#             rna *= 'A'
#         elseif dna[i] == 'A'
#             rna *= 'U'
#         end
#     end
#
#     return rna
# end


println(to_rna("G"))
println(to_rna("C"))
println(to_rna("T"))
println(to_rna("A"))
println(to_rna("ACGTGGTCTTAA") == "UGCACCAGAAUU" )
println(to_rna_1("XXX"))

println(DNA_to_RNA_nucleotide_translation('C'))
println(to_rna("ACGTGGTCTTAA") == "UGCACCAGAAUU" )
