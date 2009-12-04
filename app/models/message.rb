class Message < ActionMailer::Base



  def sliver_comment(sliver)

      recipients product.email
      from       "support@silhouettesolutions.net"
      subject    "TaxLien Pro Download Instructions"
      body       :sliver => sliver

  end


end
