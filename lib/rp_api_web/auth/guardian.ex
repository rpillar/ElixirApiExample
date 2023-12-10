defmodule RpApiWeb.Auth.Guardian do
  use Guardian, otp_app: :rp_api
  alias RpApi.Accounts

  def subject_for_token(%{id: id}, _claims) do
    subject = to_string(id)
    {:ok, subject}
  end

  def subject_for_token(_, _) do
    {:error, :no_id_provided}
  end

  def resource_from_claims(%{"sub" => id}) do
    case Accounts.get_account!(id) do
      nil -> {:error, :not_found}
      resource -> {:ok, resource}
    end
  end

  def resource_from_claims(_claims) do
    {:error, :no_id_provided}
  end

  def authenticate(email, password) do
    case Accounts.get_account_by_email(email) do
      nil -> {:error, :no_auth}
      account ->
        case validate_password(password, account.hash_password) do
          true -> generate_token(account)
          false -> {:error, :no_auth}
        end
    end
  end

  defp generate_token(account) do
    {:ok, token, _claims} = encode_and_sign(account)
    {:ok, account, token}
  end

  defp validate_password(password, has_password) do
    Bcrypt.verify_pass(password, has_password)
  end
end
