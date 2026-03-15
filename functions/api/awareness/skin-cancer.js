export async function onRequestGet(context) {
  try {
    const db = context.env.sunsafety_db;

    const { results } = await db
      .prepare(`
        SELECT
          year,
          data_type,
          cancer_group_site,
          sex,
          age_group_years,
          cases_count,
          age_standardised_rate_2001_asp AS age_standardised_rate,
          icd10_codes
        FROM skin_cancer_stats
        ORDER BY year ASC
      `)
      .all();

    return new Response(JSON.stringify(results), {
      headers: {
        "Content-Type": "application/json"
      },
      status: 200
    });
  } catch (error) {
    return new Response(
      JSON.stringify({
        error: "Failed to fetch skin cancer statistics",
        details: error.message
      }),
      {
        headers: {
          "Content-Type": "application/json"
        },
        status: 500
      }
    );
  }
}