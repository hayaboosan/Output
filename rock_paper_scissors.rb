class RockPaperScissors
  def initialize
    @gcp = { g: 'グー', c: 'チョキ', p: 'パー' }
    @win_or_lose = { win: ['勝ち！', 0], lose: ['負け！', 0], draw: ['あいこ！', 0] }
  end

  def attribute_numbers
    puts '何本勝負？(press 1 or 3 or 5)'
    gets.to_i
  end

  def numbers_check
    numbers = ''
    while numbers != 1 && numbers != 3 && numbers != 5
      numbers = attribute_numbers unless [1, 3, 5].include?(numbers)
    end
    puts "#{numbers}本勝負を選びました"
    numbers
  end

  def attribute_choice
    @judge == 'draw' ? (puts "\nあいこで...(press g or c or p)") : (puts "\nじゃんけん...(press g or c or p)")
    @choice = gets.chomp
  end

  def choice_check
    @choice = ''
    while @choice != 'g' && @choice != 'c' && @choice != 'p'
      @choice = attribute_choice unless %w[g c p].include?(@choice)
    end
  end

  def play_number(numbers)
    (1..numbers).each do |number|
      puts "\n#{number}本目"
      rock_paper_scissors
      puts @win_or_lose[@judge.to_sym][0]
      @win_or_lose[@judge.to_sym][1] += 1
    end
    puts "#{@win_or_lose[:win][1]}勝#{@win_or_lose[:lose][1]}敗"
  end

  def rock_paper_scissors
    choice_check
    @cpu = %w[g c p].sample
    puts "CPU...#{@gcp[@cpu.to_sym]}"
    puts "あなた...#{@gcp[@choice.to_sym]}"
    if @choice == @cpu
      @judge = 'draw'
      puts @win_or_lose[@judge.to_sym][0]
      rock_paper_scissors
    end
    win_or_lose
  end

  def win_or_lose
    case @choice
    when 'g' then @cpu == 'c' ? win : lose
    when 'c' then @cpu == 'p' ? win : lose
    when 'p' then @cpu == 'g' ? win : lose
    end
  end
end

def win
  @judge = 'win'
end

def lose
  @judge = 'lose'
end

play = RockPaperScissors.new
numbers = play.numbers_check
play.play_number numbers
