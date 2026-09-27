switch (true) do
{
	case (side player == west): {TMAST_PlayerColour = [0.00, 0.30, 0.60, 1.00]};
	case (side player == east): {TMAST_PlayerColour = [0.50, 0.00, 0.00, 1.00]};
	case (side player == Independent): {TMAST_PlayerColour = [0.00, 0.50, 0.00, 1.00]};
	case (side player == Civilian): {TMAST_PlayerColour = [0.40, 0.00, 0.50, 1.00]};
	default {TMAST_PlayerColour = [0.70, 0.60, 0.00, 1.00]};
};