
  --! nor_reduce:
  --! Negated reduction of bits in **arg** with the **or** logical operator.
  --! Port of nonstandard _ieee.std_logic_misc.nor_reduce_

  function nor_reduce (arg: std_logic_vector) return std_logic;

  --!-------------------------------------------------------
  --! nand_reduce:
  --! Negated reduction of bits in **arg** with the **and** logical operator.
  --! Port of nonstandard _ieee.std_logic_misc.nand_reduce_

  function nand_reduce (arg: std_logic_vector) return std_logic;

  --!-------------------------------------------------------
  --! xnor_reduce:
  --! Negated reduction of bits in **arg** with the **xor** logical operator.
  --! Port of nonstandard _ieee.std_logic_misc.xnor_reduce_

  function xnor_reduce (arg: std_logic_vector) return std_logic;

-- vsg_on

end package logic_misc;

package body logic_misc is

  function f_to_std_logic (arg: boolean) return std_logic is
  begin

    if (arg) then
      return '1';
    else
      return '0';
    end if;

  end function;

  function f_to_boolean (arg: std_logic) return boolean is
  begin

    return arg = '1';

  end function;

  function f_all_ones (arg: std_logic_vector) return std_logic is

    constant C_ONES : std_logic_vector(arg'length - 1 downto 0) :=
    (
      others => '1'
    );

  begin

    return f_to_std_logic(arg = C_ONES);

  end function;

  function f_all_zeroes (arg: std_logic_vector) return std_logic is

    constant C_ZEROES : std_logic_vector(arg'length - 1 downto 0) :=
    (
      others => '0'
    );

  begin

    return f_to_std_logic(arg = C_ZEROES);

  end function;

  function f_odd_ones (arg: std_logic_vector) return std_logic is

    variable var_result : std_logic := '0';

  begin

    for i in arg'low to arg'high loop

      var_result := var_result xor arg(i);

    end loop;

    return var_result;

  end function;

  function f_even_ones (arg: std_logic_vector) return std_logic is
  begin

    return not f_odd_ones(arg);

  end function;

  function f_odd_zeroes (arg: std_logic_vector) return std_logic is
  begin

    return f_odd_ones(not arg);

  end function;

  function f_even_zeroes (arg: std_logic_vector) return std_logic is
  begin

    return not f_odd_zeroes(arg);

  end function;

  -- vsg_off function_101

  function or_reduce (arg: std_logic_vector) return std_logic is
  begin

    return not f_all_zeroes(arg);

  end function;

  function and_reduce (arg: std_logic_vector) return std_logic is
  begin

    return f_all_ones(arg);

  end function;

  function xor_reduce (arg: std_logic_vector) return std_logic is
  begin

    return f_odd_ones(arg);

  end function;

  function nor_reduce (arg: std_logic_vector) return std_logic is
  begin

    return f_all_zeroes(arg);

  end function;

  function nand_reduce (arg: std_logic_vector) return std_logic is
  begin

    return not f_all_ones(arg);

  end function;

  function xnor_reduce (arg: std_logic_vector) return std_logic is
  begin

    return f_even_ones(arg);

  end function;

-- vsg_on

end package body logic_misc;