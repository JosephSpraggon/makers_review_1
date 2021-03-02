require './lib/school_report'

describe SchoolReport do

  context 'count_scores' do 

    it 'can count one score' do
      subject.count_scores('Green')
      expect(subject.green).to eq(1)
    end

    it 'can count two of the same score' do
      subject.count_scores('Green, Green')
      expect(subject.green).to eq(2)
    end

    it 'can count multiple different types of scores' do
      subject.count_scores('Green, Green, Red, Amber')
      expect(subject.green).to eq(2)
      expect(subject.red).to eq(1)
      expect(subject.amber).to eq(1)
    end

    it 'can count correct scores regardless of casing' do
      subject.count_scores('Green, green, Red, rEd')
      expect(subject.green).to eq(2)
      expect(subject.red).to eq(2)
    end

    it 'marks incorrect scores as uncounted' do
      subject.count_scores('Green, green, Red, rEd, yellow')
      expect(subject.green).to eq(2)
      expect(subject.red).to eq(2)
      expect(subject.uncounted).to eq(1)
    end
  end

  context 'display_scores' do

    it 'can print one score in the desired format' do
      subject.count_scores('Green')
      expect(subject.display_scores).to eq("Green: 1")
    end

    it 'can print two of the same score in the desired format' do
      subject.count_scores('Green, Green')
      expect(subject.display_scores).to eq("Green: 2")
    end

    it 'can print different types of scores' do
      subject.count_scores('Green, Red')
      expect(subject.display_scores).to eq('Green: 1' + "\n" + 'Red: 1')
    end

    it 'can print multiple different types of scores' do
      subject.count_scores('Green, green, red, Red, Amber')
      expect(subject.display_scores).to eq('Green: 2' + "\n" + 'Red: 2' + "\n" + 'Amber: 1')
    end

    it 'only prints types if they have a value < 0' do
      subject.count_scores('Green, Green, Amber')
      expect(subject.display_scores).to eq('Green: 2' + "\n" + 'Amber: 1')
    end
    
    it 'prints incorrect types as Uncounted' do
      subject.count_scores('Green, green, Red, rEd, yellow')
      expect(subject.display_scores).to eq('Green: 2' + "\n" + 'Red: 2' + "\n" + 'Uncounted: 1')
    end

  end

  context 'clear_scores' do

    it 'can clear scores' do
      subject.count_scores('Green, green, Red, rEd, yellow')
      expect(subject.display_scores).to eq('Green: 2' + "\n" + 'Red: 2' + "\n" + 'Uncounted: 1')
      subject.clear_scores
      expect(subject.display_scores).to eq("test results empty")
    end


  end



end