class Complement
  DNA_TO_RNA = {
    'C' => 'G',
    'G' => 'C',
    'T' => 'A',
    'A' => 'U',
  }

  DNA, RNA = DNA_TO_RNA.to_a.transpose

  def self.of_dna(dna_strand)
    new(
      :strand => dna_strand,
      :from => DNA,
      :to => RNA,
    ).transcription
  end

  def self.of_rna(rna_strand)
    new(
      :strand => rna_strand,
      :from => RNA,
      :to => DNA,
    ).transcription
  end

  def initialize(strand:, from:, to:)
    @strand = strand
    @from = from
    @to = to

    raise_if_strand_contains_invalid_nucleotides!
  end

  def transcription
    @strand.tr(@from.join, @to.join)
  end

  private

  def raise_if_strand_contains_invalid_nucleotides!
    raise ArgumentError unless @strand.chars.all? { |nucleotide| possible_nucleotides.include? nucleotide }
  end

  def possible_nucleotides
    @from
  end
end
