String deleteMask(Pattern format, String maskedString) =>
    maskedString.replaceAll(format, "");
